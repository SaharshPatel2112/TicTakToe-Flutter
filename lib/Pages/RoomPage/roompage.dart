import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_game/Components/primary_button.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/room_controller.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.put(RoomController());
    TextEditingController roomId = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(IconsPath.backIcon)),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Play with Private Room",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Enter Private Code And Join With Your Friend',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: roomId,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  hintText: "Enter Code Here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                      () => roomController.isLoading.value
                          ? CircularProgressIndicator()
                          : PrimaryButton(
                          buttonText: "Join Now",
                          onTap: () {
                            if (roomId.text.isNotEmpty) {
                              roomController.joinRoom(roomId.text);
                            }
                          }
                      ),
              ),
              SizedBox(height: 100),
              Text(
                'Create Private Room',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Spacer(),
              Obx(() => roomController.isLoading.value
                  ? CircularProgressIndicator()
                  : PrimaryButton(
                  buttonText: "Create Room",
                  onTap: () {
                    roomController.createRoom();
                  }
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
