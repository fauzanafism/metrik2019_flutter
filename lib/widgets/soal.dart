import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/ui/answer_page.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class SoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_soal.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 80, 30, 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "01",
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
                                  content:
                                      Text("Kosongkan jawaban ini?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return AnswerPage();
                                          }));
                                        }, child: Text("Iya")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }, child: Text("Tidak"))
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
          ),
        ],
      ),
    );
  }
}
