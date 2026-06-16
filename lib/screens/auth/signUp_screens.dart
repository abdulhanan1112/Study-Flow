import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:study_flow/providers/auth_provider.dart';
import 'package:study_flow/providers/showPassword_provider.dart';
final emailController=TextEditingController();
final passwordController=TextEditingController();
final nameController=TextEditingController();


class SignUpScreens extends ConsumerWidget {
  const SignUpScreens({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final showPassword1=ref.watch(showPassProvider1);
    final showPassword2=ref.watch(showPassProvider2);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:30.0),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/studyflow_logo.png',
                    width: 200.0,
                    height: 120.0,),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text('Create Account',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.lightBlue
                  ),

                  ),
                ),



                Align(
                    alignment: Alignment.center,
                    child: Text('Start organizing your studies today',style: TextStyle(fontWeight: FontWeight(200)),)),
                SizedBox(height: 30.0,),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller:nameController,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),

                        ),
                        SizedBox(height: 30.0,),

                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),

                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !showPassword1,
                          decoration: InputDecoration(

                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(onPressed:(){
                              ref.read(showPassProvider1.notifier).state=!showPassword1;
                            }, icon: showPassword1?Icon(Icons.visibility_off):Icon(Icons.visibility)),


                          ),

                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          obscureText: !showPassword2,
                          decoration: InputDecoration(

                            prefixIcon: Icon(Icons.lock),
                            hintText: ' Confirm Password',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(onPressed:(){
                              ref.read(showPassProvider2.notifier).state=!showPassword2;
                            }, icon: showPassword2?Icon(Icons.visibility_off):Icon(Icons.visibility)),


                          ),

                        ),
                        SizedBox(height: 30.0,),

                        SizedBox(
                          width: 500.0,
                          child: FloatingActionButton(onPressed:()async{
                            final AuthService=ref.read(AuthProvider);
                            User user=await AuthService.registerWithEmailAndPassword(emailController.text, passwordController.text);
                            if(user.uid!=null)
                            {
                              Navigator.pushReplacementNamed(context, '/dashboard');

                            }
                          },elevation: 0.0,
                            backgroundColor: Colors.blue[600],
                            child: Text('Create Account',style: TextStyle(
                                color: Colors.white
                            ),),),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            TextButton(onPressed: () {
                              Navigator.pop(context);


                            },
                                child: Text('Sign In',style: TextStyle(
                                    color: Colors.blueAccent
                                ),))
                          ],
                        )
                      ],
                    )



                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}









