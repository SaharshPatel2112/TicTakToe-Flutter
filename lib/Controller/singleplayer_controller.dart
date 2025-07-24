import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Configs/AssetsPath.dart';

class SinglePlayerController extends GetxController{
  RxList playValue = ["","","","","","","","",""].obs;
  RxBool isOtime = true.obs;
  RxInt oScore = 0.obs;
  RxInt xScore = 0.obs;

  void onClick(int index) {
    if (playValue[index] == "") {
      if(isOtime.value){
        playValue[index] = "o";
        isOtime.value = !isOtime.value;
      } else {
        playValue[index] = "x";
        isOtime.value = !isOtime.value;
      }
    }
    checkWinner();
  }

  void checkWinner() {


    if (playValue[0] == playValue[1] &&
        playValue[0] == playValue[2] &&
        playValue[0] != "") {
      print("winner is ${playValue[0]}");
      WinnerDialog(playValue[0]);
    } else if (playValue[3] == playValue[4] &&
        playValue[3] == playValue[5] &&
        playValue[3] != "") {
      WinnerDialog(playValue[3]);
      print("winner is ${playValue[3]}");
    } else if (playValue[6] == playValue[7] &&
        playValue[6] == playValue[8] &&
        playValue[6] != "") {
      print("winner is ${playValue[6]}");
      WinnerDialog(playValue[6]);
    }


    else if (playValue[0] == playValue[3] &&
        playValue[0] == playValue[6] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0]);
      print("winner is ${playValue[0]}");
    } else if (playValue[1] == playValue[4] &&
        playValue[1] == playValue[7] &&
        playValue[1] != "") {
      WinnerDialog(playValue[1]);
      print("winner is ${playValue[1]}");
    } else if (playValue[2] == playValue[5] &&
        playValue[2] == playValue[8] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2]);
      print("winner is ${playValue[2]}");



    } else if (playValue[0] == playValue[4] &&
        playValue[0] == playValue[8] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0]);
      print("winner is ${playValue[0]}");
    } else if (playValue[2] == playValue[4] &&
        playValue[2] == playValue[6] &&
        playValue[2] != "") {
      print("winner is ${playValue[2]}");
      WinnerDialog(playValue[2]);
    } else {
      if (!playValue.contains("")) {
        WinnerDialog("noone");
      }
    }
  }

  Future<dynamic> WinnerDialog(String winner) {
scoreCalculate(winner);
    return Get.defaultDialog(
        barrierDismissible: false,
        title: winner == "noone" ? "Oops!!" : "Congratulations",
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: winner == "noone"
              ? Column(
            children: [
              const Text(
                "Match Draw",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                "You both played well",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetGame();
                    },
                    child: Text("Play Again"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed("/home");
                    },
                    child: Text("Exit"),
                  )
                ],
              )
            ],
          )
              : Column(
            children: [
              SvgPicture.asset(
                IconsPath.wonIcon,
                width: 100,
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "$winner won the match",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetGame();
                    },
                    child: Text("Play Again"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed("/home");
                    },
                    child: Text("Exit"),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void resetGame() {
    playValue.value = ["", "", "", "", "", "", "", "", ""].obs;
    isOtime.value = !isOtime.value;
    Get.back();
  }

  void scoreCalculate(String winner) {
    if(winner == "o"){
      oScore.value = oScore.value + 1;
    } else if (winner == "x"){
      xScore.value = xScore.value + 1;
    }
  }
}
