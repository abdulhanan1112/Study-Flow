import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_flow/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  // instance of Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //convert to custom user
  MyUser _userFromFirebaseUser(UserCredential credential) {
    return MyUser(uid: credential.user!.uid);
  }

  // register with email and password call to Firebase
  Future<dynamic> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // sign in with email and password
  Future<dynamic> signInWithEmailAndPassword(
    String email,
    String password,

  ) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    try {
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //sign in with google
  Future<dynamic> signInWithGoogle() async {
    // instance of googleSign in
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    // initialize
    await googleSignIn.initialize(
      serverClientId: '348278272753-7t0f5ip9uipc43rlqnfpme3ie9377ve1.apps.googleusercontent.com'
    );

    //authenticate and authentication
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    //authentication
    final googleAuth = googleUser.authentication;

    //credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    try {
      UserCredential res = await _auth.signInWithCredential(credential);
      return _userFromFirebaseUser(res);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // forget password
  Future<void> forgetPassword( String email) async {
    await _auth.sendPasswordResetEmail(email: email);

  }


}
