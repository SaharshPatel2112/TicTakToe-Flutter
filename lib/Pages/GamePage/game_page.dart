import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictaktoe_multiplayer/Configs/AssetsPath.dart';

import '../../Components/ingame_usercard.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var playValue = ["o","x","o","x","o","","","",""];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },
      child: SvgPicture.asset(IconsPath.smsIcon),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
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
                      IngameUsercard(icon: IconsPath.oIcon),
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
                            Text("WON : 10"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                      children: [
                        IngameUsercard(icon: IconsPath.xIcon),
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
                              Text("WON : 10"),
                            ],
                          ),
                        ),
                      ]
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.all(10),
                width: w / 1.5,
                height: w / 1.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: const Color(0xFF000000)),
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                child: GridView.builder(
                  itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: ((context, index){
                      return Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: playValue[index] == "x"
                              ? Theme.of(context).colorScheme.primary
                          : playValue[index] == "o"
                              ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: index == 0 ?const BorderRadius.only(topLeft: Radius.circular(20),
                          )
                              : index == 2 ?const BorderRadius.only(topRight: Radius.circular(20),
                          )
                              : index == 6 ?const BorderRadius.only(bottomLeft: Radius.circular(20),
                          )
                              : index == 8 ?const BorderRadius.only(bottomRight: Radius.circular(20),
                          )
                              : const BorderRadius.only(),
                        ),
                        child: Center(
                          child: playValue[index] == "x"
                          ? SvgPicture.asset(IconsPath.xIcon, width: 50,) :
                          playValue[index] == "o"
                              ? SvgPicture.asset(IconsPath.oIcon, width: 60,) :
                          playValue[index] == ""
                              ? SizedBox() : SizedBox(),
                        ),
                      );
                    }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
