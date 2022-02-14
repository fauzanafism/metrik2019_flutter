import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/presentation/pages/login_page.dart';
import 'package:metrik2019_flutter/presentation/widgets/style.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints.expand(),
            child: Image(
              image: AssetImage("assets/images/bg_start.jpg"),
              fit: BoxFit.fitHeight,
            )),
        Container(
          color: Colors.black.withOpacity(0.1),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 170),
          child: Material(
            color: Colors.transparent,
            child: const Text(
              "welcome to",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Montserrat",
                  color: Color(0xfff5a623)),
            ),
          ),
        ),
        Container(
          child: Image(
            image: AssetImage("assets/images/metrik_start.png"),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "START",
                    style: whiteTextMont.copyWith(color: Colors.black),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
