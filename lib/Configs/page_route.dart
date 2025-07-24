import 'package:get/get.dart';
import 'package:tictaktoe_multiplayer/Pages/Auth/auth_page.dart';
import 'package:tictaktoe_multiplayer/Pages/GamePage/game_page.dart';
import 'package:tictaktoe_multiplayer/Pages/HomePage/home_page.dart';
import 'package:tictaktoe_multiplayer/Pages/LobbyPage/lobby_page.dart';
import 'package:tictaktoe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tictaktoe_multiplayer/Pages/SplashScreen/splash_page.dart';
import 'package:tictaktoe_multiplayer/Pages/UpdateProfile/update_profile.dart';
import 'package:tictaktoe_multiplayer/Pages/Welcome/welcome_page.dart';

var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),
  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
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
    name: "/gamepage",
    page: () => GamePage(),
  ),
  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfile(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),
];
