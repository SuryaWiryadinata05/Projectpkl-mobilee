import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/app/modules/home/view.dart';
import 'package:project/screen/login/auth/cubit/auth_cubit.dart';


import '../login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..LoadUserFromLocal(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // if (state is AuthSuccess) {
          //   Navigator.of(context)
          //       // HomePage() harusnya
          //       .push(MaterialPageRoute(builder: (context) => HomePage()));
          // }
          if (state is AuthLoginSuccess) {
            Navigator.of(context)
                // HomePage() harusnya
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          } else if (state is AuthError) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginOnePage()));
          }
        },
        child: Scaffold(
          body: Center(
            child: Container(),
          ),
        ),
      ),
    );
  }
}
