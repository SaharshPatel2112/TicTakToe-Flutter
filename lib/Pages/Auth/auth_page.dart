import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Components/primary_button_with_icon.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/auth_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconsPath.applogo,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Welcome",
                  style: TextStyle(fontSize: 20),
                ),
                Text("Please sign in to continue.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            PrimaryButtonWithIcon(
                buttonText: "Login With Google",
                onTap: (){
                  authController.login();
                },
                iconpath: IconsPath.googleIcon,
            )
          ],
        ),
      ),
    );
  }
}
