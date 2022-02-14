import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:metrik2019_flutter/widgets/style.dart';

import '../presentation/bloc/countersoal_bloc.dart';
import '../presentation/bloc/user_bloc.dart';

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
                      return SingleChildScrollView(
                        child: StreamBuilder<DocumentSnapshot>(
                            stream: userAnswer.doc(user.user!.uid).snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                Map<String, dynamic> snapdata = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      for (int i = 1; i < 11; i++)
                                        NumAnswer(i, snapdata[i.toString()])
                                    ]),
                                    Column(children: [
                                      for (int i = 11; i < 16; i++)
                                        NumAnswer(i, snapdata[i.toString()])
                                    ]),
                                  ],
                                );
                              } else {
                                return Text("Loading");
                              }
                            }),
                      );
                    },
                  ),
                ),
                Spacer(),
                BlocBuilder<CountersoalBloc, CountersoalState>(
                  builder: (context, soal) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CountersoalBloc>().add(ResetEvent());
                        Navigator.popUntil(context, (route) {
                          return route.isFirst;
                        });
                      },
                      child: Text(
                        "SELESAI",
                        style: whiteTextMont.copyWith(color: Colors.black),
                      ),
                      style: blackButton.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    );
                  },
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
