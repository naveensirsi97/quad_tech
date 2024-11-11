import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quad_tech/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(const MainScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/sp.jpg'),
      ),
    );
  }
}
