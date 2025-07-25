import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashController = Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(IconsPath.applogo, width: 150,),
      ),
    );
  }
}
