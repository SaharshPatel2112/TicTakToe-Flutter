import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tictaktoe_multiplayer/Configs/page_route.dart';
import 'package:tictaktoe_multiplayer/Configs/theme.dart';
import 'package:tictaktoe_multiplayer/Pages/SplashScreen/splash_page.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tic Tak Toe Multiplayer',
      theme: lightTheme,
      home: SplashPage(),
    );
  }
}
