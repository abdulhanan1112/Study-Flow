import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_flow/models/user.dart';
import 'package:study_flow/providers/auth_provider.dart';
import 'package:study_flow/providers/showPassword_provider.dart';
final emailController=TextEditingController();
final passwordController=TextEditingController();
String error='';
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final showPassword=ref.watch(showPassProvider1);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/studyflow_logo.png',
                    width: 200.0,
                    height: 120.0,
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'StudyFlow',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),

                SizedBox(height: 30.0),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign in to continue your studies',
                  style: TextStyle(fontWeight: FontWeight(200)),
                ),
                SizedBox(height: 20.0),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller:emailController,
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(showPassProvider1.notifier).state=!showPassword;
                            },
                            icon: showPassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgetPassword');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 500.0,
                        child: FloatingActionButton(
                          onPressed: () async{
                            final AuthService=ref.read(AuthProvider);
                            MyUser user=await AuthService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                            if(user==null)
                              {
                                error='Please give correct Credentials';
                              }
                            else {
                              Navigator.pushReplacementNamed(
                                context,
                                '/dashboard',
                              );
                            }
                          },
                          backgroundColor: Colors.blue[600],
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Text(
                        '--------------------------------------------------OR---------------------------------------------------',
                        style: TextStyle(),
                      ),
                      SizedBox(height: 40.0),
                      SizedBox(
                        width: 400,
                        height: 60,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            final AuthObj=ref.read(AuthProvider);
                            MyUser user=await AuthObj.signInWithGoogle();
                            if(user ==null)
                              {
                                print('Hello');
                              }
                            else{
                              Navigator.pushReplacementNamed(context, '/dashboard');
                            }


                          },
                          icon: const FaIcon(FontAwesomeIcons.google),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 200.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Sign Up',
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
    );
  }
}


