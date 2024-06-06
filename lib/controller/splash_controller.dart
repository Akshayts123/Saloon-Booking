import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barbershop/views/pages/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/pages/dashboard/dashboard.dart';
import '../views/pages/introduction/intro.dart';
import '../views/pages/login_signup/login.dart';

class SplashScreenViewModel extends  GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    getThemeStatus();
    super.onInit();
  }

  animationInitilization() {
    Timer(Duration(seconds: 4),
        checkFirstSeen);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);
    if (FirebaseAuth.instance.currentUser != null && _introSeen   ) {
      Get.to(Dashboard());
    }else if (_introSeen) {
      Get.to(LoginPage());
    }  else {
      await prefs.setBool('intro_seen', true);
      Get.to(OnboardScreenLive());
    }
  }
}