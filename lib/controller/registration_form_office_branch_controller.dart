import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/api/api.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/controller/registration_form_private_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'dart:math' as math;

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class RegistrationFormOfficeBranchController extends GetxController {
  final MainController _mController = Get.find();
  late WebViewPlusController webviewController;
  String get data => "${_mController.jobDetailFormData}";
  late TextEditingController provinceTxtController,
      subDistrictTxtController,
      officeBranchTxtController,
      officeBranchAddressTxtController;
  RxList<AddressModel?> provinceList = RxList();
  RxList<AddressModel?> subDistrictList = RxList();
  RxList<AddressModel?> officeBrachList = RxList();
  RxBool _recaptchaValidation = RxBool(false);
  List<RxBool> validationForm =
      List.generate(RegistrationFormOfficeBranchLabel.values.length, (i) {
    switch (i) {
      case 0:
        return RxBool(true);
      case 2:
        return RxBool(true);
      case 14:
        return RxBool(true);
      case 15:
        return RxBool(true);
      case 16:
        return RxBool(true);
      case 17:
        return RxBool(true);
      default:
        return RxBool(false);
    }
  });

  TextEditingController? textEditingController(int i) {
    switch (i) {
      case 0:
        return provinceTxtController;
      case 1:
        return subDistrictTxtController;
      case 2:
        return officeBranchTxtController;
      case 3:
        return officeBranchAddressTxtController;
      default:
        return null;
    }
  }

  Widget textEditingLabel(int i) {
    switch (i != 3) {
      case true:
        return Text(
          RegistrationFormOfficeBranchLabel.values[i].title,
          style: textStyleW600(fontSize: 14),
        );
      case false:
        return Text(
          RegistrationFormOfficeBranchLabel.values[i].title,
          style: textStyleW600(fontSize: 14, fontColor: GREY),
        );
      default:
        return Container();
    }
  }

  Widget suffixIcon() {
    return Transform.rotate(
        angle: 15 / math.pi,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: ORANGE,
          size: 20,
        ));
  }

  InputDecoration? inputDecoration(int i) {
    switch (i != 3) {
      case true:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText:
                "Pilih ${RegistrationFormOfficeBranchLabel.values[i].title}",
            hintStyle: textStyleW500(fontColor: GREY, fontSize: 16));
      case false:
        return null;

      default:
        return null;
    }
  }

  void Function()? onFieldTap(int i) {
    switch (i != 3) {
      case true:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormOfficeBranchLabel.values[i].title}");
      case false:
        return null;
      default:
        return null;
    }
  }

  double _initialExpandSizeDropdown(int i) {
    switch (selectedListItem(i)!.length) {
      case 2:
        return 0.2;
      case 3:
        return 0.3;
      case 4:
        return 0.35;
      case 5:
        return 0.45;
      default:
        return 0.7;
    }
  }

  void Function()? dropDownSelecting(int i, String title) {
    return () {
      DropDownState(
        DropDown(
            isSearchVisible: _initialExpandSizeDropdown(i).isGreaterThan(0.45),
            bottomSheetTitle: Text(title, style: textStyleW600(fontSize: 16)),
            data: selectedListItem(i)!,
            selectedItems: selectedItem(i),
            enableMultipleSelection: false,
            initialExpandSize: _initialExpandSizeDropdown(i),
            isExpanded: _initialExpandSizeDropdown(i).isGreaterThan(0.45)),
      ).showModal(Get.context);
    };
  }

  List<SelectedListItem>? selectedListItem(int i) {
    switch (i) {
      case 0:
        return List.generate(provinceList.length,
            (i) => SelectedListItem(name: provinceList[i]!.nama!));
      case 1:
        return List.generate(subDistrictList.length,
            (i) => SelectedListItem(name: subDistrictList[i]!.nama!));
      case 2:
        return List.generate(
            officeBrachList.length,
            (i) => SelectedListItem(
                name: "Kantor Cabang ${officeBrachList[i]!.nama!}"));
      default:
        return null;
    }
  }

  dynamic Function(List<dynamic>)? selectedItem(int i) {
    switch (i) {
      case 0:
        return (item) async {
          onChangeForm(i + 1)?.call("");
          onChangeForm(i + 2)?.call("");
          provinceTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findSubdistrict();
          onChangeForm(i)?.call(provinceTxtController.text);
        };
      case 1:
        return (item) async {
          onChangeForm(i + 1)?.call("");
          subDistrictTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findOfficeBranch();
          onChangeForm(i)?.call(subDistrictTxtController.text);
        };
      case 2:
        return (item) {
          officeBranchTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(officeBranchTxtController.text);
        };

      default:
        return null;
    }
  }

  void Function(String?)? onChangeForm(int i) {
    return (val) {
      if (val == "") {
        validationForm[i].value = false;
      } else if (val!.isValidTextAndNumber()) {
        validationForm[i].value = false;
      } else {
        validationForm[i].value = true;
      }
    };
  }

  String? Function(String?)? onValidateForm(int i) {
    return (val) {
      if (val!.isEmpty) {
        return "${RegistrationFormOfficeBranchLabel.values[i].title} Wajib diisi";
      } else if (val.isValidTextAndNumber()) {
        return "Terdapat karakter tidak valid";
      }
      return null;
    };
  }

  Future<void> _findSubdistrict() async {
    subDistrictList.value = [];
    officeBrachList.value = [];
    subDistrictTxtController.clear();
    officeBranchTxtController.clear();
    var _i_ =
        provinceList.indexWhere((e) => e!.nama == provinceTxtController.text);
    var payload = provinceList[_i_]?.id;
    var getSubDistrict = (await Api().GET("kota?id_provinsi=$payload")
        as Map<String, dynamic>)['kota_kabupaten'] as List<dynamic>;
    subDistrictList.value = List.generate((getSubDistrict).length,
        (index) => AddressModel.fromJson(getSubDistrict[index]));
  }

  Future<void> _findOfficeBranch() async {
    officeBrachList.value = [];
    officeBranchTxtController.clear();
    var _i_ = subDistrictList
        .indexWhere((e) => e!.nama == subDistrictTxtController.text);
    var payload = subDistrictList[_i_]?.id;
    var getRegency = (await Api().GET("kecamatan?id_kota=$payload")
        as Map<String, dynamic>)['kecamatan'] as List<dynamic>;
    officeBrachList.value = List.generate((getRegency).length,
        (index) => AddressModel.fromJson(getRegency[index]));
  }

  void validateRecaptcha(String val) {
    if (val == "true") {
      _recaptchaValidation.value = true;
    } else {
      _recaptchaValidation.value = false;
    }
  }

  void Function()? next() {
    if (validationForm.contains(RxBool(false)) || !_recaptchaValidation.value) {
      return null;
    }
    return () async {
      await Get.toNamed(ROUTE.selfieAndKtpVerification.name);
    };
  }

  @override
  void onInit() {
    provinceTxtController = TextEditingController();
    subDistrictTxtController = TextEditingController();
    officeBranchTxtController = TextEditingController();
    officeBranchAddressTxtController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() async {
    _mController.startProgressAnim();
    var _province = (await Api().GET("provinsi")
        as Map<String, dynamic>)['provinsi'] as List<dynamic>;
    provinceList.value = List.generate(
        _province.length, (index) => AddressModel.fromJson(_province[index]));
    super.onReady();
  }
}
