import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/lobby_controller.dart';

class RoomInfo extends StatelessWidget {
  final String roomCode;
  const RoomInfo({super.key, required this.roomCode});

  @override
  Widget build(BuildContext context) {
    LobbyController lobbyController = Get.put(LobbyController());
    final wc = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
            children: [
              Row(
                children: [
                  Text('Generated Room Code'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            roomCode,
                            style: TextStyle(
                              fontSize: wc / 11,
                              letterSpacing: 2.5,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),)
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      lobbyController.copyRoomCode(roomCode);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: SvgPicture.asset(IconsPath.copyIcon),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                  "Share This Private code with your Friends & Ask Theme To Join The Game",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,)
              ),

              // fee

            ],
          ),
          ),
        ],
      ),
    );
  }
}
