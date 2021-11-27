import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/ui/guidance_page.dart';

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
                child: Image(
                  image: AssetImage('assets/images/hello_user.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 37,
                margin: EdgeInsets.fromLTRB(155, 90, 65, 0),
                child: Text("G2-0062",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Adam", fontSize: 39, fontWeight: FontWeight.bold)),
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
                      onPressed: () {},
                      child: Text(
                        "Uji Coba",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Adam",
                            color: Colors.black),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return GuidancePage();
                        }));
                      },
                      child: Text("Penyisihan",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: "Adam",
                              color: Colors.black))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
