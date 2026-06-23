import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/services/auth.dart';




// auth provider of class AuthServices in which there is connection with Firebase
final AuthProvider=Provider<AuthServices>((ref)=>AuthServices());

// provider to check user
final getCurrentUser=Provider((ref)=>FirebaseAuth.instance.currentUser);

