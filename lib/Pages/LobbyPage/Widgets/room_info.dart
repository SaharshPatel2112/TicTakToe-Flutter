import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';

class RoomInfo extends StatelessWidget {
  final String roomCode;
  const RoomInfo({super.key, required this.roomCode});

  @override
  Widget build(BuildContext context) {
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
                            style: const TextStyle(
                              fontSize: 40,
                              letterSpacing: 2.5,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),)
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: SvgPicture.asset(IconsPath.copyIcon),
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
