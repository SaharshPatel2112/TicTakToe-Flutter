import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictaktoe_game/Components/primary_button_with_icon.dart';
import 'package:tictaktoe_game/Configs/AssetsPath.dart';
import 'package:tictaktoe_game/Controller/profile_controller.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    RxString imagePath = "".obs;
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () =>
                      imagePath == ""
                          ? Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                          )
                          : Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              //color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.file(
                                File(imagePath.value),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        imagePath.value = await profileController.pickerImage(
                          ImageSource.camera,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.cameraIcon),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        imagePath.value = await profileController.pickerImage(
                          ImageSource.gallery,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(IconsPath.galleryIcon),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Enter Your name"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Text(
                    "You can change these details later  from profile page. don’t worry",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() => profileController.isLoading.value? CircularProgressIndicator() :

            PrimaryButtonWithIcon(
              buttonText: "Save",
              onTap: () {
                profileController.updateProfile(nameController.text);
              },
              iconpath: IconsPath.saveIcon,
            ),

            )
          ],
        ),
      ),
    );
  }
}
