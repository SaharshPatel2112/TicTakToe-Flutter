import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Pages/HomePage/home_page.dart';
import '../Pages/Welcome/welcome_page.dart'; // Import your home screen

class SplashScreenController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser == null) {
      await Get.offAll(const WelcomePage());
    } else {
      await Get.offAll(const HomePage());
    }
  }
}