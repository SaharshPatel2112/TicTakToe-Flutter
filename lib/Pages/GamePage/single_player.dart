import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/singleplayer_controller.dart';

class SinglePlayer extends StatelessWidget {
  const SinglePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    SinglePlayerController singlePlayerController = Get.put(
      SinglePlayerController(),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(IconsPath.backIcon)),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "TicTakToe",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.oIcon),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(IconsPath.wonIcon),
                            SizedBox(width: 10),
                            Obx(() => Text("WON : ${singlePlayerController.oScore}"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.xIcon),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(IconsPath.wonIcon),
                            SizedBox(width: 10),
                            Obx(() => Text("WON : ${singlePlayerController.xScore}"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Obx(() =>Container(
                margin: EdgeInsets.all(10),
                width: w / 1.5,
                height: w / 1.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                child: GridView.builder(
                  itemCount: singlePlayerController.playValue.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        singlePlayerController.onClick(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color:
                          singlePlayerController.playValue[index] == "o"
                              ? Theme.of(context).colorScheme.secondary
                              : singlePlayerController.playValue[index] ==
                              "x"
                              ? Theme.of(context).colorScheme.primary
                              : singlePlayerController.playValue[index] ==
                              ""
                              ? Theme.of(
                            context,
                          ).colorScheme.primaryContainer
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
                          singlePlayerController.playValue[index] == "o"
                              ? SvgPicture.asset(IconsPath.oIcon, width: 50)
                              : singlePlayerController.playValue[index] ==
                              "x"
                              ? SvgPicture.asset(IconsPath.xIcon, width: 60)
                              : singlePlayerController.playValue[index] ==
                              ""
                              ? SizedBox()
                              : SizedBox(),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      color: singlePlayerController.isOtime.value
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        singlePlayerController.isOtime.value
                            ? SvgPicture.asset(IconsPath.oIcon, width: 30)
                            : SvgPicture.asset(
                          IconsPath.xIcon,
                          width: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Turn",
                          style: TextStyle(
                            fontSize: 30,
                            color:
                            Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
