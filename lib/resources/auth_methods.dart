import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:virtual_vortex/utils/snack_bar.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //?? sign-in with google ->
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      //** signing in ->
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //** authenticate ->
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      //** access token ->
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //** user credentials ->
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      //** to check whether signIn happened or not ->
      User? user = userCredential.user;
      if (user != null) {
        //** if he created account right now then we have to store it in firestore
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
}
