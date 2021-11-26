import 'package:flutter/material.dart';
import 'package:metrik2019_flutter/ui/home_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // bool isObscure = true;

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
          Container(
            constraints: BoxConstraints.expand(),
            child: Image(
              image: AssetImage('assets/images/metrik_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: idController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "ID Number",
                          hintStyle: TextStyle(fontFamily: "Montserrat")),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: 300,
                    height: 50,
                    child: TextField(
                      obscureText: true,

                      controller: passController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Password",
                          hintStyle: TextStyle(fontFamily: "Montserrat")),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF181335), Color(0xFFBD0446)],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                                fontFamily: "Montserrat", color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
