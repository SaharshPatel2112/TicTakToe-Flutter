import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Models/room_model.dart';
import 'package:tictaktoe_game/Models/user_model.dart';

import '../Configs/AssetsPath.dart';

class MultiPlayerController extends GetxController {
  ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 2));

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map(
        (event) => RoomModel.fromJson(
          event.data()!,
        )
    );
  }
  Future<void> updateData(
      String roomId,
      List<String> gameValue,
      int index,
      bool isOTurn,
      RoomModel roomData,
      String? currentUserId,
      ) async {
    final isPlayer1Turn = isOTurn;
    final isPlayer1 = currentUserId == roomData.player1!.id;
    final isPlayer2 = currentUserId == roomData.player2?.id;

    if ((isPlayer1Turn && isPlayer1) || (!isPlayer1Turn && isPlayer2)) {
      List<String> oldvalue = List.from(gameValue);
      if (oldvalue[index] == '') {
        if (isPlayer1Turn) {
          oldvalue[index] = "O";
        } else {
          oldvalue[index] = "X";
        }
        await db.collection("rooms").doc(roomId).update({
          "gameValue" : oldvalue,
          "isOTurn" : !isOTurn,
        });
      }
      checkWinner(oldvalue, roomData);
    } else {
      Get.snackbar("Wait!", "It's not your turn.");
    }
    // List<String> oldvalue = gameValue;
    // if (isOTurn) {
    //   if (oldvalue[index] == '') {
    //     oldvalue[index] = "O";
    //     //print(oldValue);
    //     await db.collection("rooms").doc(roomId).update({
    //       "gameValue" : oldvalue,
    //       "isOTurn" : false,
    //     });
    //   }
    // } else if (!isOTurn) {
    //   if (oldvalue[index] == '') {
    //     oldvalue[index] = "X";
    //     //print(oldValue);
    //     await db.collection("rooms").doc(roomId).update({
    //       "gameValue" : oldvalue,
    //       "isOTurn" : true,
    //     });
    //   }
    // }
    // checkWinner(oldvalue, roomData);
  }

  void checkWinner(List<String> playValue, RoomModel roomData) {

    if (playValue[0] == playValue[1] &&
        playValue[0] == playValue[2] &&
        playValue[0] != "") {
      print("winner is ${playValue[0]}");
      WinnerDialog(playValue[0],roomData);
    } else if (playValue[3] == playValue[4] &&
        playValue[3] == playValue[5] &&
        playValue[3] != "") {
      WinnerDialog(playValue[3],roomData);
      print("winner is ${playValue[3]}");
    } else if (playValue[6] == playValue[7] &&
        playValue[6] == playValue[8] &&
        playValue[6] != "") {
      print("winner is ${playValue[6]}");
      WinnerDialog(playValue[6],roomData);
    }


    else if (playValue[0] == playValue[3] &&
        playValue[0] == playValue[6] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0],roomData);
      print("winner is ${playValue[0]}");
    } else if (playValue[1] == playValue[4] &&
        playValue[1] == playValue[7] &&
        playValue[1] != "") {
      WinnerDialog(playValue[1],roomData);
      print("winner is ${playValue[1]}");
    } else if (playValue[2] == playValue[5] &&
        playValue[2] == playValue[8] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2],roomData);
      print("winner is ${playValue[2]}");



    } else if (playValue[0] == playValue[4] &&
        playValue[0] == playValue[8] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0],roomData);
      print("winner is ${playValue[0]}");
    } else if (playValue[2] == playValue[4] &&
        playValue[2] == playValue[6] &&
        playValue[2] != "") {
      print("winner is ${playValue[2]}");
      WinnerDialog(playValue[2],roomData);
    } else {
      if (!playValue.contains("")) {
        WinnerDialog("noone",roomData);
      }
    }
  }

  Future<dynamic> WinnerDialog(String winner, RoomModel roomData) {
    // scoreCalculate(winner);
    confettiController.play();
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
                      resetPlayValue(roomData);
                      Get.back();
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
                      playAgain(winner, roomData);
                      Get.back();
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

  Future<void> playAgain(String wonTeam, RoomModel roomData) async {

    if(wonTeam=="O"){
      String totalWins = roomData.player1!.totalWins!;
      int totalWin = int.parse(totalWins);
      totalWin = totalWin + 1;
      UserModel newPlayer1 = UserModel(
        id: roomData.player1!.id,
        email: roomData.player1!.email,
        role: roomData.player1!.role,
        totalWins: totalWin.toString(),
        name: roomData.player1!.name,
        totalCoins: roomData.player1!.totalCoins,
        yourTurn: roomData.player1!.yourTurn,
      );
      await db.collection("rooms").doc(roomData.id).update({
        "gameValue" : ["","","","","","","","",""],
        "player1" : newPlayer1.toJson(),
      });

      
    } else if(wonTeam=="X"){
      String totalWins = roomData.player2!.totalWins!;
      int totalWin = int.parse(totalWins);
      totalWin = totalWin + 1;
      UserModel newPlayer2 = UserModel(
        id: roomData.player2!.id,
        email: roomData.player2!.email,
        role: roomData.player2!.role,
        totalWins: totalWin.toString(),
        name: roomData.player2!.name,
        totalCoins: roomData.player2!.totalCoins,
        yourTurn: roomData.player2!.yourTurn,
      );
      await db.collection("rooms").doc(roomData.id).update({
        "gameValue" : ["","","","","","","","",""],
        "player2" : newPlayer2.toJson(),
      });
    }
  }

  Future<void> resetPlayValue(RoomModel roomData) async {
    await db.collection("rooms").doc(roomData.id).update({
      "gameValue" : ["","","","","","","","",""],
    });
    Get.back();
  }
}