import 'package:appointments_app/pages/main_page.dart';
import 'package:appointments_app/pages/sign_up_page.dart';
import 'package:appointments_app/splash/splash_page.dart';
import 'package:appointments_app/splash/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'theme/palak_mp_theme.dart';
import 'utils/network/dio_client.dart';

void main() async{
  await GetStorage.init();
  await AppPathProvider.initPath();


      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: PalakMpTheme.lightTheme(),
      darkTheme: PalakMpTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      title: "Appointment",
      home: MainPage(),
    );
  }
}
