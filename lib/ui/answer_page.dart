import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrik2019_flutter/bloc/user_bloc.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class AnswerPage extends StatelessWidget {
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
        backgroundColor: mainColor,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Answer",
                  style:
                      whiteTextMont.copyWith(color: Colors.black, fontSize: 16),
                ),
                Spacer(),
                Container(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, user) {
                      return Column(
                        children: [
                          StreamBuilder<DocumentSnapshot>(
                              stream: userAnswer.doc(user.user!.uid).snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Column(
                                    children: [
                                      
                                        NumAnswer(1, data['1'])
                                    ],
                                  );
                                } else {
                                  return Text("Loading");
                                }
                              }),
                        ],
                      );
                    },
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Jawaban berhasil diinput")));
                      return route.isFirst;
                    });
                  },
                  child: Text(
                    "SELESAI",
                    style: whiteTextMont.copyWith(color: Colors.black),
                  ),
                  style: blackButton.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
