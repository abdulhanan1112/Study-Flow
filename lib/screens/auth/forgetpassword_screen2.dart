import 'package:flutter/material.dart';

class ForgetPasswordScreen2 extends StatelessWidget {

  const ForgetPasswordScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final email=ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.email_outlined, size: 100),
                      radius: 100,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check your email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'We\'ve sent a password reset link to',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight(200),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 150.0),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check your spam folder if you didn\'t get it yet?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight(200),
                        color: Colors.black
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(color: Colors.blue,fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
