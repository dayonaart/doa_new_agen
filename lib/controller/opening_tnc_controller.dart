import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/dummies_data/dummies.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'dart:math' as math;

import 'package:mobilenew/style/colors.dart';

class OpeningTncController extends GetxController
    with GetTickerProviderStateMixin {
  ScrollController scController = ScrollController();
  late List<AnimationController> expandController;
  late List<Rx<Animation<double>>> animation;
  late List<RxBool> isOpen;
  late List<RxDouble> arrowAngle;
  List<RxBool> tncBtn = List.generate(2, (i) => false.obs);
  List<String> btnTitle =
      List.generate(2, (i) => OpeningTncWord.sayaSetujuDengan.text);
  List<String> btnTitleOrange = [
    OpeningTncWord.skRekeningTabungan.text,
    OpeningTncWord.persetujuanPenawaranProduk.text
  ];
  List<String> dummiesTnc = List.generate(4, (index) => TNC);
  List<String> dummiesTncTitle = List.generate(4, (index) => TNC_TITLE);
  void _prepareAnimations() {
    expandController = List.generate(
        dummiesTnc.length,
        (i) => AnimationController(
            vsync: this, duration: const Duration(milliseconds: 500)));
    animation = List.generate(
        dummiesTnc.length,
        (i) => CurvedAnimation(
              parent: expandController[i],
              curve: Curves.fastOutSlowIn,
            ).obs);
    isOpen = List.generate(dummiesTnc.length, (i) => false.obs);
    arrowAngle = List.generate(dummiesTnc.length, (i) => (15 / math.pi).obs);
  }

  void Function() openingTnc(int i) {
    return () {
      isOpen = List.generate(isOpen.length, (b) {
        if (i == b) {
          if (isOpen[b] == RxBool(true)) {
            arrowAngle[b].value = 15 / math.pi;
            expandController[b].reverse();
            return RxBool(false);
          } else {
            arrowAngle[b].value = 5 / math.pi;
            expandController[b].forward();
            return RxBool(true);
          }
        } else {
          arrowAngle[b].value = 15 / math.pi;
          expandController[b].reverse();
          return RxBool(false);
        }
      });
      scrollToDown();
    };
  }

  void onChangeTncBtn(int i) {
    tncBtn[i].value = !tncBtn[i].value;
  }

  List<Color> get btnColor {
    return tncBtn.map((e) => e.value ? ORANGE : Colors.white).toList();
  }

  void Function()? next() {
    if (tncBtn.contains(RxBool(false))) {
      return null;
    }
    return () async {
      await Get.toNamed(ROUTE.inputPhoneNumber.name);
    };
  }

  void scrollToDown() {
    scController.animateTo(
      Get.height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in expandController) {
      element.dispose();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _prepareAnimations();
  }

  @override
  void onReady() {
    scrollToDown();
    super.onReady();
  }
}
