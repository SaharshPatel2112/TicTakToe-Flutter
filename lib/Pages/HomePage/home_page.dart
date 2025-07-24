import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Components/primary_button_with_icon.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/profile_controller.dart';
import 'package:tictaktoe_game/Pages/UpdateProfile/update_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                //SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TIC TAC TOE",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppions",
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Text(
                  "With Multiplayer",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(IconsPath.applogo, width: 200),
            Column(
              children: [
                PrimaryButtonWithIcon(
                  buttonText: "Pass & Play",
                  onTap: (){
                    Get.toNamed("/singlePlayer");
                  },
                  iconpath: IconsPath.userIcon,
                ),
                SizedBox(height: 20),
                PrimaryButtonWithIcon(
                  buttonText: "Multi Player",
                  onTap: (){
                    Get.toNamed("/room");
                  },
                  iconpath: IconsPath.groupIcon,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(IconsPath.infoIcon),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(IconsPath.gameIcon),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(IconsPath.googleIcon),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(UpdateProfile());
                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.account_circle, color: Colors.white,size: 30,)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
