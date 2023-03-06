import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';

class AccountTypeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Rx<Animation<double>> animation;
  RxBool isShowFullFeature = false.obs;
  RxString showFullFeatureBtnTitle = AccountTypeWord.selengkapnya.text.obs;
  RxString expandDesc = FeatureExpandListDesc.desc1.desc.obs;
  RxDouble showFullFeatureArrowAngle = 15.0.obs;
  RxList<String> featureValue =
      FeatureTitleList.values.map((e) => e.value1).toList().obs;
  RxString accountCardName =
      AccountCardName.kartuDebitBNIAgen46GPNCombo1.title.obs;
  ScrollController scController = ScrollController();

  int get featureLength {
    if (isShowFullFeature.value) {
      return FeatureTitleList.values.length;
    } else {
      return FeatureTitleList.values.take(3).length;
    }
  }

  final MainController _mController = Get.find();
  RxInt corouselIndex = 0.obs;

  @override
  void onInit() {
    _prepareAnimations();
    super.onInit();
  }

  @override
  void onReady() {
    _mController.startProgressAnim();
    scrollToDown();
    super.onReady();
  }

  Function(int index, CarouselPageChangedReason reason)? onPageChanged() {
    return (index, reason) {
      corouselIndex.value = index;
      switch (index) {
        case 0:
          featureValue.value =
              FeatureTitleList.values.map((e) => e.value1).toList();
          expandDesc.value = FeatureExpandListDesc.desc1.desc;
          accountCardName.value =
              AccountCardName.kartuDebitBNIAgen46GPNCombo1.title;
          break;
        case 1:
          featureValue.value =
              FeatureTitleList.values.map((e) => e.value2).toList();
          expandDesc.value = FeatureExpandListDesc.desc2.desc;
          accountCardName.value =
              AccountCardName.kartuDebitBNIAgen46GPNCombo2.title;
          break;
        case 2:
          featureValue.value =
              FeatureTitleList.values.map((e) => e.value3).toList();
          expandDesc.value = FeatureExpandListDesc.desc3.desc;
          accountCardName.value =
              AccountCardName.kartuDebitBNIAgen46GPNCombo3.title;
          break;
        default:
      }
    };
  }

  Color carouselIndexColor(int i) {
    return corouselIndex.value == i ? ORANGE : GREY;
  }

  void Function() showFullFeature() {
    return () {
      isShowFullFeature.value = !isShowFullFeature.value;
      if (isShowFullFeature.value) {
        showFullFeatureArrowAngle.value = 5.0;
        showFullFeatureBtnTitle.value = AccountTypeWord.sembunyikan.text;
        expandController.forward();
        scrollToDown();
      } else {
        showFullFeatureBtnTitle.value = AccountTypeWord.selengkapnya.text;
        showFullFeatureArrowAngle.value = 15.0;
        expandController.reverse();
      }
    };
  }

  void _prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    ).obs;
  }

  void Function()? next() {
    return () async {
      await Get.toNamed(ROUTE.ktpRegistration.name);
    };
  }

  void scrollToDown() {
    scController.animateTo(
      Get.height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
