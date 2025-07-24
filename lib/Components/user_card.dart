import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';





class UserCard extends StatelessWidget {
  const UserCard({super.key});

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
                "Saharsh",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox(width: 10),
                  Text("50 Coins",style: Theme.of(context).textTheme.bodyMedium,),
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
          ),
        )
      ],
    );
  }
}
