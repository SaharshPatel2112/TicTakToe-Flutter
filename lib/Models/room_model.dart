

import 'package:tictaktoe_game/Models/user_model.dart';

class RoomModel {
  String? id;
  String? entryFee;
  String? winningPrize;
  String? drawMatch;
  UserModel? player1;
  UserModel? player2;
  String? gameStatus;
  String? player1Status;
  String? player2Status;
  List<String>? gameValue;
  bool? isOTurn;
  RoomModel({
    this.id,
    this.entryFee,
    this.winningPrize,
    this.drawMatch,
    this.player1,
    this.player2,
    this.gameStatus,
    this.player1Status,
    this.player2Status,
    this.gameValue,
    this.isOTurn,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["entryFee"] is String) {
      entryFee = json["entryFee"];
    }
    if (json["winningPrize"] is String) {
      winningPrize = json["winningPrize"];
    }
    if (json["drawMatch"] is String) {
      drawMatch = json["drawMatch"];
    }
    if (json["player1"] is Map) {
      player1 =
      json["player1"] == null ? null : UserModel.fromJson(json["player1"]);
    }
    if (json["player2"] is Map) {
      player2 =
      json["player2"] == null ? null : UserModel.fromJson(json["player2"]);
    }
    if (json["gameStatus"] is String) {
      gameStatus = json["gameStatus"];
    }
    if (json["player1Status"] is String) {
      player1Status = json["player1Status"];
    }
    if (json["player2Status"] is String) {
      player2Status = json["player2Status"];
    }
    if (json["gameValue"] is List) {
      gameValue = json["gameValue"] == null
          ? null
          : List<String>.from(json["gameValue"]);
    }
    if (json["isOTurn"] is bool) {
      isOTurn = json["isOTurn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["entryFee"] = entryFee;
    _data["winningPrize"] = winningPrize;
    _data["drawMatch"] = drawMatch;
    if (player1 != null) {
      _data["player1"] = player1?.toJson();
    }
    if (player2 != null) {
      _data["player2"] = player2?.toJson();
    }
    _data["gameStatus"] = gameStatus;
    _data["player1Status"] = player1Status;
    _data["player2Status"] = player2Status;
    if (gameValue != null) {
      _data["gameValue"] = gameValue;
    }
    _data["isOTurn"] = isOTurn;
    return _data;
  }
}