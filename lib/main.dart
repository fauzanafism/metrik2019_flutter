import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrik2019_flutter/presentation/bloc/countersoal_bloc.dart';
import 'package:metrik2019_flutter/presentation/bloc/viewpass_bloc.dart';
import 'presentation/bloc/user_bloc.dart';
import 'ui/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<ViewpassBloc>(create: (context) => ViewpassBloc()),
        BlocProvider<CountersoalBloc>(create: (context) => CountersoalBloc())
      ],
      child: MaterialApp(
        title: 'Metrik 2019',
        theme: ThemeData(textTheme: TextTheme()),
        home: LandingPage(),
      ),
    );
  }
}
