import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Configs/messages.dart';
import 'package:tictaktoe_game/Models/room_model.dart';
import 'package:tictaktoe_game/Models/user_model.dart';
import 'package:tictaktoe_game/Pages/LobbyPage/lobby_page.dart';
import 'package:uuid/uuid.dart';

class RoomController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var uuid = Uuid();
  RxString roomCode = "".obs;
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) {
      errorMessage("No authenticated user.");
      return;
    }
    final snapshot = await db.collection("user").doc(uid).get();
    final data = snapshot.data();
    if (data == null) {
      errorMessage("User document not found in Firestore!");

      return;
    }
    user.value = UserModel.fromJson(data);
    print("Loaded user from Firestore: ${user.value.toJson()}");
  }

  Future<void> createRoom() async {
    isLoading.value = true;
    String id = uuid.v4().substring(0,6).toUpperCase();
    roomCode.value = id;

    final authUser = auth.currentUser;
    var player1 = UserModel(
      id: user.value.id ?? authUser?.uid,
      name: user.value.name ?? authUser?.displayName ?? "Unknown",
      email: user.value.email ?? authUser?.email ?? "",
      totalWins: user.value.totalWins ?? "0",
      role: "admin",
    );
    print("Creating Room with player1: ${player1.toJson()}");

    var newRoom = RoomModel(
        id: id,
        entryFee: "10",
        winningPrize: "20",
        drawMatch: "",
        player1: player1,
        gameStatus: "lobby",
        player1Status: "waiting",
        gameValue: ["","","","","","","","",""],
        isOTurn: true,
    );

    try {
      await db.collection("rooms").doc(id).set(newRoom.toJson());
      Get.to(LobbyPage(roomId: id));
      successMessage("Room created!");
    } catch (e) {
      print("Error creating room: $e");
      errorMessage("Error creating room.");
    }
    isLoading.value = false;
  }

  Future<void> joinRoom(String roomId) async {
    isLoading.value = true;

    final authUser = auth.currentUser;
    var player2 = UserModel(
      id: user.value.id ?? authUser?.uid,
      name: user.value.name ?? authUser?.displayName ?? "Unknown",
      email: user.value.email ?? authUser?.email ?? "",
      totalWins: user.value.totalWins ?? "0",
      role: "player",
    );

    print("Joining Room as player2: ${player2.toJson()}");

    try {
      await db.collection("rooms").doc(roomId).update({
        "player2": player2.toJson(),
        "player2Status": "Waiting",
      });
      Get.to(LobbyPage(roomId: roomId));
      successMessage("Joined Room!");
    } catch (e) {
      print("Error joining room: $e");
      errorMessage("Error joining room.");
    }
    isLoading.value = false;
  }
}