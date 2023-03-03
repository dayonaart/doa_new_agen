import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/dummies_data/dummies.dart';
import 'dart:math' as math;

import 'package:mobilenew/style/colors.dart';

class OpeningTncController extends GetxController
    with GetTickerProviderStateMixin {
  late List<AnimationController> expandController;
  late List<Rx<Animation<double>>> animation;
  late List<RxBool> isOpen;
  late List<RxDouble> arrowAngle;
  List<RxBool> tncBtn = List.generate(2, (i) => false.obs);
  List<String> btnTitle = ["Saya setuju dengan", "Saya setuju dengan"];
  List<String> btnTitleOrange = [
    " “Syarat dan Ketentuan Rekening Tabungan Perorangan”",
    " “Persetujuan Penawaran Produk dan Jasa Layanan”"
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
      isOpen[i].value = !isOpen[i].value;
      if (isOpen[i].value) {
        arrowAngle[i].value = 5 / math.pi;
        expandController[i].forward();
      } else {
        arrowAngle[i].value = 15 / math.pi;
        expandController[i].reverse();
      }
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
      await Get.toNamed('inputPhoneNumber');
    };
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
}
