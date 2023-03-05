import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/controller/take_camera_ktp_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';

class RegistrationFormController extends GetxController {
  final MainController _mController = Get.find();
  String get ktpPath => _mController.ktpFilePath.value;
  InputImage get inputImage => InputImage.fromFilePath(ktpPath);
  final TakeCameraKtpController _takeKtpController = Get.find();
  late TextEditingController nikTextController,
      fullNameTextController,
      dobTextController,
      referalCodeTextController;
  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }

  TextEditingController? textController(int i) {
    switch (i) {
      case 0:
        return nikTextController;
      case 1:
        return fullNameTextController;
      case 2:
        return dobTextController;
      case 3:
        return referalCodeTextController;
      default:
        return null;
    }
  }

  Widget textEditingLabel(int i) {
    switch (i) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "NIK",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: "Nama Lengkap", style: textStyleW600(fontSize: 16)),
            TextSpan(
                text: " (tanpa gelar)",
                style: textStyleW500(fontSize: 16, fontColor: GREY)),
          ])),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Tanggal Lahir",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: "Kode Referral ", style: textStyleW600(fontSize: 16)),
            TextSpan(
                text: "(Opsional)",
                style: textStyleW500(fontSize: 16, fontColor: GREY)),
          ])),
        );
      default:
        return Container();
    }
  }

  @override
  void onInit() {
    nikTextController =
        TextEditingController(text: _takeKtpController.ktpData[0]);
    fullNameTextController =
        TextEditingController(text: _takeKtpController.ktpData[1]);
    dobTextController =
        TextEditingController(text: _takeKtpController.ktpData[2]);
    referalCodeTextController = TextEditingController();
    super.onInit();
  }

  void Function() test() {
    return () {
      print(DateFormat("dd MMMM yyyy")
          .format(DateTime.parse(_takeKtpController.ktpData[2])));
    };
  }
}
