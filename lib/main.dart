import 'package:flutter/material.dart';
import 'package:study_flow/dashboard/dashboard_screen.dart';
import 'package:study_flow/notes/edit_notes_screen.dart';
import 'package:study_flow/notes/notes_screen.dart';
import 'package:study_flow/notes/open_notes_screen.dart';
import 'package:study_flow/screens/auth/forget_password_screen.dart';
import 'package:study_flow/screens/auth/forgetpassword_screen2.dart';
import 'package:study_flow/screens/auth/login_screen.dart';
import 'package:study_flow/screens/auth/signUp_screens.dart';
import 'package:study_flow/screens/auth/splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login' : (context)=>const LoginScreen(),
        '/register': (context) => const SignUpScreens(),
        '/dashboard' :(context) =>const Dashboard(),
        '/forgetPassword':(context)=>const ForgetPasswordScreen(),
        '/forgetPassword2':(context)=>const ForgetPasswordScreen2(),
        '/edit_notes_screen' :(context)=>EditNotesScreen(),
        '/open_notes_screen' :(context)=>OpenNotesScreen(),
        '/notes_screen' :(context)=>NotesScreen(),
      },
    );
  }
}
