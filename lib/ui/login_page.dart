import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrik2019_flutter/bloc/user_bloc.dart';
import 'package:metrik2019_flutter/bloc/viewpass_bloc.dart';
import 'package:metrik2019_flutter/repository/auth_services.dart';
import 'package:metrik2019_flutter/ui/home_page.dart';
import 'package:metrik2019_flutter/widgets/style.dart';

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
            margin: EdgeInsets.only(top: 30),
            child: Image(
              image: AssetImage('assets/images/metrik_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70, top: 40),
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
                    child: BlocBuilder<ViewpassBloc, ViewpassState>(
                      builder: (context, state) {
                        return TextField(
                          obscureText: state.isSecure,
                          controller: passController,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ViewpassBloc>()
                                        .add(TapEvent());
                                  },
                                  child: (state.isSecure)
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: "Password",
                              hintStyle: TextStyle(fontFamily: "Montserrat")),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return GradientButton(
                          onPressed: () async {
                            context.read<UserBloc>().add(LoginEvent(
                                await AuthService.signIn(
                                    idController.text + '@metrik.com', passController.text)));
                            (state is UserInitialized)
                                ? Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Gagal login')));
                          },
                          text: 'Masuk');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
