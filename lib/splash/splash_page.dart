import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    Timer(const Duration(milliseconds: 2800), () {
      // box.read("jwt") == null ? Get.to(LoginPage()) :
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff1592b),
        // height: double.infinity,
        // width: double.infinity,
        child: Center(
          child: Image.asset(
            "assets/tv_ac/Dhakalive-ott.gif",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
