import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/services/auth.dart';




// auth provider of class AuthServices in which there is connection with Firebase
final AuthProvider=Provider<AuthServices>((ref)=>AuthServices());

//