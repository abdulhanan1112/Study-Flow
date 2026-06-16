import 'package:flutter/material.dart';
import 'package:study_flow/screens/auth/forget_password_screen.dart';
import 'package:study_flow/screens/auth/forgetpassword_screen2.dart';
import 'package:study_flow/screens/auth/login_screen.dart';
import 'package:study_flow/screens/auth/signUp_screens.dart';
import 'package:study_flow/screens/auth/splash_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignUpScreens(),
      ),
    );
  }
}
