import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';

enum AccountCardName {
  kartuDebitBNIAgen46GPNCombo1,
  kartuDebitBNIAgen46GPNCombo2,
  kartuDebitBNIAgen46GPNCombo3
}

extension AccountCardNameTitle on AccountCardName {
  String get title {
    switch (this) {
      case AccountCardName.kartuDebitBNIAgen46GPNCombo1:
        return "Kartu Debit BNI Agen46 GPN Combo";
      case AccountCardName.kartuDebitBNIAgen46GPNCombo2:
        return "Kartu Debit BNI Agen46 GPN Combo 2";
      case AccountCardName.kartuDebitBNIAgen46GPNCombo3:
        return "Kartu Debit BNI Agen46 GPN Combo 3";
      default:
        return "";
    }
  }
}

enum FeatureTitleList {
  setoranAwal,
  totalTarikTunai,
  limitTransaksiBelanja,
  transferAntarRekeningBNIviaATM,
  transferAntarBankviaATM,
}

extension FeatureTitle on FeatureTitleList {
  String get title {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Setoran Awal';
      case FeatureTitleList.totalTarikTunai:
        return 'Total Tarik Tunai';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Limit Transaksi Belanja';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Transfer Antar Rekening BNI via ATM';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Transfer Antar Bank via ATM';
      default:
        return '';
    }
  }

  String get value1 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp150.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp15 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp50 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp100 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp25 juta / hari';
      default:
        return '';
    }
  }

  String get value2 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp160.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp16 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp60 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp150 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp35 juta / hari';
      default:
        return '';
    }
  }

  String get value3 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp190.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp19 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp90 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp190 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp45 juta / hari';
      default:
        return '';
    }
  }
}

enum FeatureExpandListDesc { desc1, desc2, desc3 }

extension FeatureExpandDesc on FeatureExpandListDesc {
  String get desc {
    switch (this) {
      case FeatureExpandListDesc.desc1:
        return "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
      case FeatureExpandListDesc.desc2:
        return "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
      case FeatureExpandListDesc.desc3:
        return "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of section 1.10.32.";
      default:
        return "";
    }
  }
}

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
