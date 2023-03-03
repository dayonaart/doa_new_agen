import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';

class KtpRegistrationController extends GetxController
    with WidgetsBindingObserver {
  RxBool isTakePicture = false.obs;
  // final MainController _mainController = Get.find();
  final MainController _mController = Get.find();
  String requirementDescription =
      "• * sesuai dengan identitas Anda\n• * tidak silau & tidak buram\n• * terbaca jelas dan tidak terpotong\n• Tidak ada objek lain selain KTP dalam foto";

  List<TextSpan> get requirementDescriptionWidget {
    return requirementDescription.split("").map((e) {
      if (RegExp(r'[*]', caseSensitive: true).hasMatch(e)) {
        return TextSpan(
            text: "KTP",
            style: textStyleW500(fontSize: 12, fontColor: BLUE_TEXT));
      }
      return TextSpan(
          text: e, style: textStyleW600(fontSize: 12, fontColor: BLUE_TEXT));
    }).toList();
  }

  void Function() next() {
    return () {
      Get.toNamed(ROUTE.takeCameraKtp.name);
    };
  }

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }
}
