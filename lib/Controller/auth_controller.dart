import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictaktoe_game/Configs/messages.dart';
import 'package:tictaktoe_game/Pages/UpdateProfile/update_profile.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        Get.snackbar('Login Cancelled', 'Google sign-in was cancelled.');
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await auth.signInWithCredential(credential);
      successMessage("Login Success");
      Get.offAll(() => const UpdateProfile());
    } catch (e) {
      errorMessage("Login failed");
    }
  }


}