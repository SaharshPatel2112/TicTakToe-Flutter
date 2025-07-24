import 'package:get/get.dart';
import 'package:tictaktoe_game/Pages/Auth/auth_page.dart';
import 'package:tictaktoe_game/Pages/GamePage/multi_player.dart';
import 'package:tictaktoe_game/Pages/GamePage/single_player.dart';
import 'package:tictaktoe_game/Pages/HomePage/home_page.dart';
import 'package:tictaktoe_game/Pages/RoomPage/roompage.dart';
import 'package:tictaktoe_game/Pages/SplashScreen/splash_page.dart';
import 'package:tictaktoe_game/Pages/UpdateProfile/update_profile.dart';
import 'package:tictaktoe_game/Pages/Welcome/welcome_page.dart';


var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),
  GetPage(
    name: "/auth",
    page: () => AuthPage(),
  ),
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),
  GetPage(
    name: "/splash",
    page: () => SplashPage(),
  ),
  GetPage(
    name: "/multiPlayer",
    page: () => MultiPlayer(roomId: '',),
  ),
  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfile(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),
  GetPage(
    name: "/singlePlayer",
    page: () => SinglePlayer(),
  ),
];
