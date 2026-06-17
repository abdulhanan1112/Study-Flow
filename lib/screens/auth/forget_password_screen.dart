import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Icon(Icons.lock, size: 50),
                      backgroundColor: Colors.blueAccent,
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter the email linked to your StudyFlow account and we\'ll send a reset link.',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight(200),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 30.0),

                        SizedBox(
                          width: 500.0,

                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgetPassword2');
                            },
                            elevation: 0.0,
                            backgroundColor: Colors.blue[600],
                            child: Text(
                              'Send reset link',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Remember your password?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                );
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
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
