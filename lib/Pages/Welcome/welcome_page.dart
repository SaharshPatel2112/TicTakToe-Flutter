import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Pages/Auth/auth_page.dart';
import 'package:tictaktoe_game/Pages/RoomPage/roompage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var pages = [
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome1),
            Text(
              "Welcome",
            style: TextStyle(fontSize: 20),
            ),
            Text(
                "Most fun game now available on your smartphone device!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome2),
            Text(
              "Compete",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "Play online with your friends and top the leaderboard!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome3),
            Text(
                "Scoreboard",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "Earn points for each game and make your way to top the scoreboard!",
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: (){
                  Get.offAll(RoomPage());
                }, child: Text("Get Started",
              style: TextStyle(color: Colors.red),
            )
            )
          ],
        ),
      ),
    ];

    return Scaffold(
      body: ConcentricPageView(
          itemBuilder: (index) {
            return pages[index];
          },
          colors: [Colors.red, Colors.blue, Colors.green],
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        onFinish: (){
            Get.offAll(AuthPage());
        },


      ),
    );
  }
}
