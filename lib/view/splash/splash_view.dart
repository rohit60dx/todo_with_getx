// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rohittest/appstyle/app_colors.dart';
import 'package:rohittest/appstyle/app_dimensions.dart';
import 'package:rohittest/appstyle/app_extentions.dart';
import 'package:rohittest/view/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dsh = Get.isRegistered<SplashController>()
        ? Get.find<SplashController>()
        : Get.put(SplashController());
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text("TODO").regularText(
                          AppColors.blackColor, AppDimensions.d20)),
                ],
              ),
            ],
          ));
    });
  }
}
