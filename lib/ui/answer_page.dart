import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class AnswerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Tidak diizinkan')));
        return false;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                "Your Answer",
                style:
                    whiteTextMont.copyWith(color: Colors.black, fontSize: 16),
              ),
              Spacer(),
              Container(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
