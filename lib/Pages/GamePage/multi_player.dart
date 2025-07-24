import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/multiplayer_controller.dart';
import 'package:tictaktoe_game/Models/room_model.dart';
import 'package:confetti/confetti.dart';

import '../../Components/ingame_usercard.dart';

class MultiPlayer extends StatelessWidget {
  final String roomId;
  const MultiPlayer({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    MultiPlayerController multiPlayerController = Get.put(
      MultiPlayerController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(IconsPath.smsIcon),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: StreamBuilder(
                stream: multiPlayerController.getRoomDetails(roomId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    RoomModel? roomData = snapshot.data;
                    var playValue = roomData!.gameValue;
                    return Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(IconsPath.backIcon),
                            SizedBox(width: 15),
                            Text(
                              "Play Game",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IngameUsercard(
                                  icon: IconsPath.oIcon,
                                  name: roomData!.player1!.name!,
                                  image: ImagePath.boy1,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(IconsPath.wonIcon),
                                      SizedBox(width: 10),
                                      Text("WON : ${roomData.player1!.totalWins}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IngameUsercard(
                                  name: roomData.player2!.name!,
                                  icon: IconsPath.xIcon,
                                  image: ImagePath.boy2,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(IconsPath.wonIcon),
                                      SizedBox(width: 10),
                                      Text("WON : ${roomData.player2!.totalWins}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: w / 1.5,
                          height: w / 1.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: const Color(0xFF000000),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          child: GridView.builder(
                            itemCount: 9,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  multiPlayerController.updateData(
                                    roomId,
                                    playValue,
                                    index,
                                    roomData.isOTurn!,
                                    roomData,
                                    currentUserId,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color:
                                    playValue![index] == "X"
                                        ? Theme.of(context).colorScheme.primary
                                        : playValue[index] == "O"
                                        ? Theme.of(
                                      context,
                                    ).colorScheme.secondary
                                        : Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
                                    borderRadius:
                                    index == 0
                                        ? const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )
                                        : index == 2
                                        ? const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    )
                                        : index == 6
                                        ? const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                    )
                                        : index == 8
                                        ? const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                    )
                                        : const BorderRadius.only(),
                                  ),
                                  child: Center(
                                    child:
                                    playValue[index] == "X"
                                        ? SvgPicture.asset(
                                      IconsPath.xIcon,
                                      width: 50,
                                    )
                                        : playValue[index] == "O"
                                        ? SvgPicture.asset(
                                      IconsPath.oIcon,
                                      width: 60,
                                    )
                                        : playValue[index] == ""
                                        ? SizedBox()
                                        : SizedBox(),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:
                              roomData.isOTurn == true
                                  ? Row(
                                children: [
                                  SvgPicture.asset(
                                    IconsPath.oIcon,
                                    width: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Turn",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                                  : Row(
                                children: [
                                  SvgPicture.asset(
                                    IconsPath.xIcon,
                                    width: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Turn",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Text("No data");
                  }
                },
              ),
            ),
          ),
        ),
        ConfettiWidget(
            confettiController: multiPlayerController.confettiController,
            shouldLoop: false,
            blastDirection: pi / 2,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Colors.green,
              Colors.deepPurple,
            ],
          gravity: 0.01,
          emissionFrequency: 0.05,
        )
      ],
    );
  }
}
