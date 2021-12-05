import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrik2019_flutter/bloc/countersoal_bloc.dart';
import 'package:metrik2019_flutter/bloc/user_bloc.dart';

ButtonStyle blackButton = ElevatedButton.styleFrom(
    primary: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));

TextStyle whiteTextMont = TextStyle(
    fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.bold);

Color mainColor = Color(0xfff5a623);

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  GradientButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF181335), Color(0xFFBD0446)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
          style: blackButton,
          onPressed: onPressed,
          child: Text(
            text,
            style: whiteTextMont,
          )),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;

  OptionButton({required this.text});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userAnswer = firestore.collection("user");
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: Color(0xFF181335),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Peringatan"),
                    content: Text("Pilih '$text' sebagai jawabanmu?"),
                    actions: [
                      SizedBox(
                        child: BlocBuilder<CountersoalBloc, CountersoalState>(
                          builder: (context, soal) {
                            return BlocBuilder<UserBloc, UserState>(
                              builder: (context, user) {
                                return TextButton(
                                    onPressed: () {
                                      userAnswer.add({soal.noSoal: text});
                                      context
                                          .read<CountersoalBloc>()
                                          .add(NextsoalEvent());
                                      Navigator.pop(context);
                                    },
                                    child: Text("Iya"));
                              },
                            );
                          },
                        ),
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
          child: Text(
            text,
            style: whiteTextMont
                .copyWith(fontSize: 45, color: Colors.black, shadows: [
              Shadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 10))
            ]),
          )),
    );
  }
}
