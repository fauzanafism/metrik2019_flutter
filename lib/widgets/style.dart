import 'package:flutter/material.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: whiteTextMont,
            ),
          )),
    );
  }
}
