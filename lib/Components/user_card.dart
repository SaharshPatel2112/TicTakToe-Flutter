import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tictaktoe_game/Configs/AssetsPath.dart';


class UserCard extends StatelessWidget {
  final String image;
  final String name;
  final String coins;
  final String status;
  const UserCard({super.key, required this.name, required this.coins, required this.image, this.status = ""});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: w / 2.7,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox(width: 10),
                  Text("$coins Coins",style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              status == "" ? SizedBox()
                  : status == "Ready" ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.done, color: Colors.green, size: 20,),
                  SizedBox(width: 10),
                  Text(status),
                ],
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later_outlined , color: Colors.orange, size: 20,),
                  SizedBox(width: 10),
                  Text(status ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: -50,
          left: w / 2.7 / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 3,
                )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(image),
            ),
          ),
        )
      ],
    );
  }
}
