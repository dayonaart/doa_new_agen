import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';
import 'package:screenshot/screenshot.dart';

class RegistrationFormController extends GetxController {
  final _mController = Get.put(MainController());
  String get ktpPath => _mController.ktpFilePath.value;
  String get _myKtpPath => "assets/my_ktp.JPG";
  RxBool enableEditing = RxBool(false);
  Rx<Widget> ktpWidget = Rx(Container());
  DateTime? _selectedDob;
  final ScreenshotController _screenshotController = ScreenshotController();
  late TextEditingController nikTextController,
      fullNameTextController,
      dobTextController,
      referalCodeTextController;
  late List<RxBool> validationForm;
  void Function() enableOnEditTextField() {
    return () {
      enableEditing.value = !enableEditing.value;
    };
  }

  Future<void> _cropKtpImage() async {
    var _crop = await _screenshotController.captureFromWidget(SizedBox(
      width: Get.width / 2,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        // child: Image.file(File(ktpPath), fit: BoxFit.cover),
        child: Image.asset(_myKtpPath, fit: BoxFit.cover),
      ),
    ));
    ktpWidget.value = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.memory(_crop, height: 128, width: 191, fit: BoxFit.cover));
  }

  void Function() datePicker() {
    return () async {
      Get.dialog(Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: Get.height / 3,
              width: Get.width / 1.2,
              child: CupertinoDatePicker(
                minimumDate: DateTime(1900),
                maximumDate: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _selectedDob ??
                    DateTime.now().subtract(const Duration(seconds: 10)),
                onDateTimeChanged: (DateTime newDateTime) {
                  _selectedDob = newDateTime;
                  dobOnChange()
                      .call(DateFormat("dd MMMM yyyy").format(newDateTime));
                  dobTextController.text =
                      DateFormat("dd MMMM yyyy").format(newDateTime);
                },
              ),
            ),
          ),
        ],
      ));
    };
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

  Widget? suffixHelperWidget(int i) {
    switch (i) {
      case 0:
        if (!validationForm[i].value) {
          return IconButton(
              onPressed: _dialogHelper(i),
              icon: const Icon(Icons.help, color: ORANGE));
        }
        return null;
      case 1:
        if (!validationForm[i].value) {
          return IconButton(
              onPressed: _dialogHelper(i),
              icon: const Icon(Icons.help, color: ORANGE));
        }
        return null;
      case 2:
        if (!validationForm[i].value) {
          return IconButton(
              onPressed: _dialogHelper(i),
              icon: const Icon(Icons.help, color: ORANGE));
        }
        return const Icon(Icons.date_range, color: ORANGE);
      default:
        return null;
    }
  }

  void Function()? _dialogHelper(int i) {
    switch (i) {
      case 0:
        return () async {
          await DIALOG_HELPER("Masukan 16 Digit NIK");
        };
      case 1:
        return () async {
          await DIALOG_HELPER(
              "Nama Lengkap tidak boleh berisi karakter invalid");
        };
      case 2:
        return () async {
          await DIALOG_HELPER("Masukan Tanggal Lahir");
        };
      default:
        return null;
    }
  }

  void Function(String) nikOnChange() {
    return (val) {
      if (val.length != 16) {
        validationForm[0].value = false;
      } else {
        validationForm[0].value = true;
      }
    };
  }

  void Function(String) fullNameOnChange() {
    return (val) {
      if (!val.contains(nameRegExp)) {
        validationForm[1].value = false;
      } else {
        validationForm[1].value = true;
      }
    };
  }

  void Function(String) dobOnChange() {
    return (val) {
      if (val.isEmpty) {
        validationForm[2].value = false;
      } else {
        validationForm[2].value = true;
      }
    };
  }

  void Function(String)? formOnChange(int i) {
    switch (i) {
      case 0:
        return nikOnChange();
      case 1:
        return fullNameOnChange();
      case 2:
        return dobOnChange();
      default:
        return null;
    }
  }

  TextInputType? textInputType(int i) {
    switch (i) {
      case 0:
        return TextInputType.number;
      case 1:
        return TextInputType.name;
      case 2:
        return TextInputType.datetime;
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
    _mController.startProgressAnim();
    nikTextController = TextEditingController();
    fullNameTextController = TextEditingController();
    dobTextController = TextEditingController();
    referalCodeTextController = TextEditingController();
    validationForm = List.generate(3, (i) {
      return RxBool(false);
    });
    super.onInit();
  }

  @override
  void onReady() async {
    await _cropKtpImage();
    super.onReady();
  }

  void Function()? next() {
    if (validationForm.contains(false.obs)) {
      return null;
    }
    return () async {
      print("NEXT");
    };
  }
}
