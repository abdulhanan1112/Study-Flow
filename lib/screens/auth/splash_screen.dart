import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      final user=FirebaseAuth.instance.currentUser;
      if(user==null)
      {
        Navigator.pushReplacementNamed(context, '/login');
      }
      else{
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/studyflow_logo.png'),
            Text(
              'StudyFlow',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Your Academic Companion',
              style: TextStyle(fontWeight: FontWeight(150)),
            ),
          ],
        ),
      ),
    );
  }
}
