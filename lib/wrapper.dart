import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_flow/dashboard/dashboard_screen.dart';
import 'package:study_flow/screens/auth/login_screen.dart';
import 'package:study_flow/screens/auth/splash_screen.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const SplashScreen();
            }
          if(snapshot.hasData)
            {
              return const Dashboard();
            }
          return const LoginScreen();

        }
    );
  }
}

