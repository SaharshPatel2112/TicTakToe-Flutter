import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tictaktoe_multiplayer/Configs/messages.dart';
import 'package:tictaktoe_multiplayer/Pages/HomePage/home_page.dart';
import 'package:tictaktoe_multiplayer/Pages/UpdateProfile/update_profile.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> login() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled sign in
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

  Future<void> updateProfile() async {
    Get.offAll(() => const HomePage());
  }
}