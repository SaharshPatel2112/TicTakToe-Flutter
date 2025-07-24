import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Components/primary_button.dart';
import 'package:tictaktoe_game/Components/user_card.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/lobby_controller.dart';
import 'package:tictaktoe_game/Controller/room_controller.dart';
import 'package:tictaktoe_game/Pages/GamePage/multi_player.dart';
import 'package:tictaktoe_game/Pages/LobbyPage/Widgets/pricing_area.dart';
import 'package:tictaktoe_game/Pages/LobbyPage/Widgets/room_info.dart';


class LobbyPage extends StatelessWidget {
  final String roomId;
  const LobbyPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    LobbyController lobbyController = Get.put(LobbyController());
    RoomController roomController = Get.put(RoomController());
    RxInt timer = 5.obs;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(IconsPath.backIcon),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Play With Private Room",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RoomInfo(roomCode: roomId),
                const SizedBox(height: 20),
                StreamBuilder(
                  stream: lobbyController.getRoomDetails(roomId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.player1Status == "Ready" &&
                          snapshot.data!.player2Status == "Ready") {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          Get.to(MultiPlayer(roomId: roomId));
                        });
                      } else {}
                      return Column(
                        children: [
                          PriceArea(
                            entryPrice: snapshot.data!.entryFee!,
                            winningPrice: snapshot.data!.winningPrize!,
                          ),
                          const SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UserCard(
                                image: ImagePath.boy1,
                                name: snapshot.data!.player1!.name!,
                                coins: "00",
                                status: snapshot.data!.player1Status!,
                              ),
                              snapshot.data!.player2 == null
                                  ? Container(
                                    width: w / 2.6,
                                    child: Text("waiting for Other"),
                                  )
                                  : UserCard(
                                    image: ImagePath.boy2,
                                    name: snapshot.data!.player2!.name!,
                                    coins: "00",
                                    status: snapshot.data!.player2Status!,
                                  ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          snapshot.data!.player1!.email ==
                                  roomController.user.value.email
                              ? PrimaryButton(
                                buttonText: "Start Game",
                                onTap: () {
                                  lobbyController.updatePlayer1Status(
                                    roomId,
                                    "Ready",
                                  );
                                },
                              )
                              : snapshot.data!.player2Status == "waiting"
                              ? PrimaryButton(
                                buttonText: "Ready",
                                onTap: () async {
                                  lobbyController.updatePlayer2Status(
                                    roomId,
                                    "Ready",
                                  );
                                },
                              )
                              : snapshot.data!.player2Status == "Ready"
                              ? PrimaryButton(
                                buttonText: "waiting for start",
                                onTap: () {
                                  lobbyController.updatePlayer2Status(
                                    roomId,
                                    "Ready",
                                  );
                                },
                              )
                              : PrimaryButton(
                                buttonText: "Ready",
                                onTap: () {
                                  lobbyController.updatePlayer2Status(
                                    roomId,
                                    "Ready",
                                  );
                                },
                              ),
                        ],
                      );
                    } else {
                      return Icon(Icons.error);
                    }
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
