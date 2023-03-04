import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController progresscontroller;
  RxDouble progress = 0.0.obs;
  RxString ktpFilePath = RxString("");

  void setKtpFilePath(String path) {
    ktpFilePath.value = path;
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
