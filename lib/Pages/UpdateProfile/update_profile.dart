import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_multiplayer/Components/primary_button_with_icon.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tictaktoe_multiplayer/Controller/auth_controller.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.cameraIcon),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.galleryIcon),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Your name"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "You can change these details later  from profile page. don’t worry",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            PrimaryButtonWithIcon(
              buttonText: "Save",
              onTap: () {
                authController.updateProfile();
              },
              iconpath: IconsPath.saveIcon,
            ),
          ],
        ),
      ),
    );
  }
}
