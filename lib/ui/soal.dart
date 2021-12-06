import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrik2019_flutter/bloc/countersoal_bloc.dart';
import 'package:metrik2019_flutter/bloc/user_bloc.dart';
import 'package:metrik2019_flutter/ui/answer_page.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class SoalPage extends StatelessWidget {
  final int jumlahSoal;
  SoalPage(this.jumlahSoal);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userAnswer = firestore.collection('user');
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Tidak diizinkan')));
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_soal.jpg"),
                      fit: BoxFit.cover)),
            ),
            BlocBuilder<CountersoalBloc, CountersoalState>(
              builder: (context, soal) {
                return (soal.noSoal == jumlahSoal + 1)
                    ? Center(
                        child: GradientButton(text: "SELESAI", onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AnswerPage();
                          }));
                        },),
                      )
                    : Container(
                        margin: EdgeInsets.fromLTRB(30, 80, 30, 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  soal.noSoal.toString(),
                                  style: whiteTextMont.copyWith(
                                      fontSize: 30, color: Colors.black),
                                ),
                                Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Peringatan"),
                                              content: Text(
                                                  "Kosongkan jawaban ini?"),
                                              actions: [
                                                BlocBuilder<UserBloc,
                                                    UserState>(
                                                  builder: (context, user) {
                                                    return TextButton(
                                                        onPressed: () {
                                                          userAnswer.doc(user.user!.uid).update({
                                                            soal.noSoal.toString():
                                                                ""
                                                          });
                                                          context
                                                              .read<
                                                                  CountersoalBloc>()
                                                              .add(
                                                                  NextsoalEvent());
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Iya"));
                                                  },
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Tidak"))
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                        width: 135,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/button_skip.png"))),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OptionButton(text: "a"),
                                OptionButton(text: "b"),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OptionButton(text: "c"),
                                OptionButton(text: "d"),
                              ],
                            ),
                            Spacer()
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
