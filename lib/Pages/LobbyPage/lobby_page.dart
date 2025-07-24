import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_multiplayer/Components/primary_button.dart';
import 'package:tictaktoe_multiplayer/Components/user_card.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';
import 'package:tictaktoe_multiplayer/Pages/GamePage/game_page.dart';
import 'package:tictaktoe_multiplayer/Pages/LobbyPage/Widgets/pricing_area.dart';
import 'package:tictaktoe_multiplayer/Pages/LobbyPage/Widgets/room_info.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(IconsPath.backIcon),
                    SizedBox(width: 15),
                    Text(
                      "Play with Private Room",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RoomInfo(roomCode: "211201"),
                SizedBox(height: 20),
                PriceArea(),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    UserCard(),
                    UserCard(),
                  ],
                ),
                SizedBox(height: 20),
                PrimaryButton(buttonText: "Start Game", onTap: (){
                  Get.to(GamePage());
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
