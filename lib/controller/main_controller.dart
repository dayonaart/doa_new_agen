import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController progresscontroller;
  RxDouble progress = 0.0.obs;
  RxString ktpFilePath = RxString("");
  RxMap inputNumberData = RxMap();
  RxMap ktpData = RxMap();
  void setInputNumberData(Map<String, dynamic> data) {
    inputNumberData.value = data;
  }

  void setKtpFilePath(String path) {
    ktpFilePath.value = path;
  }

  void setKtpData(Map<String, dynamic> data) {
    ktpData.value = data;
  }

  @override
  void onInit() {
    progresscontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        progress.value = progresscontroller.value;
      });
    super.onInit();
  }

  void startProgressAnim() {
    if (progresscontroller.status == AnimationStatus.completed) {
      progresscontroller.reset();
      progresscontroller.forward();
      return;
    }
    progresscontroller.forward();
  }

  void disposeAnime() {
    progresscontroller.dispose();
  }
}
