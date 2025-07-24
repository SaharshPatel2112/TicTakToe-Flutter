import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';

class IngameUsercard extends StatelessWidget {
  final String icon;
  const IngameUsercard({super.key, required this.icon});

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
              Container(
                height: 40,
                width: 75,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
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
