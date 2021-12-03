import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/ui/guidance_page.dart';
import 'package:metrik2019_flutter/ui/soal.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Image(
              image: AssetImage('assets/images/bg_login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                margin: EdgeInsets.only(top: 30),
                child: Image(
                  image: AssetImage('assets/images/hello_user.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 7, right: 25),
                margin: const EdgeInsets.all(40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("G2-0062",
                      style: whiteTextMont.copyWith(fontSize: 43)),
                ),
              )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SoalPage(5);
                        }));
                      },
                      child: Text(
                        "Uji Coba",
                        style: whiteTextMont.copyWith(color: Colors.black),
                      )),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return GuidancePage();
                        }));
                      },
                      child: Text("Penyisihan",
                          style: whiteTextMont.copyWith(color: Colors.black))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
