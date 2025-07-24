import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tictaktoe_game/Configs/messages.dart';
import 'package:tictaktoe_game/Models/user_model.dart';
import 'package:tictaktoe_game/Pages/HomePage/home_page.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> user = UserModel().obs;


  Future<void> updateProfile(String name) async {
    isLoading.value = true;
    try {
      if(name!="") {
        var newUser = UserModel(
          id: auth.currentUser!.uid,
          name: name,
          email: auth.currentUser!.email,
          totalWins: "0",
        );

        await db
            .collection("user")
            .doc(auth.currentUser!.uid)
            .set(newUser.toJson());

        successMessage("Profile Updated");
        Get.offAll(() => const HomePage());
      } else {
        errorMessage("Please fill your name");
      }
    } catch (e) {
      print(e);
      errorMessage("Profile Update Failed");
    }
    isLoading.value = false;
  }

  Future<String> pickerImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return image.path;
    } else {
      return "";
    }
  }
}
