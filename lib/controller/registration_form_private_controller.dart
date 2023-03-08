import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/api/api.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'dart:math' as math;

class RegistrationFormPrivateController extends GetxController {
  final MainController _mController = Get.find();
  RxList<AddressModel?> provinceList = RxList();
  RxList<AddressModel?> subDistrictList = RxList();
  RxList<AddressModel?> regencyList = RxList();
  List<RxBool> validationForm =
      List.generate(RegistrationFormPrivateLabel.values.length, (i) {
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
  late TextEditingController fullNameTxtController, //0
      pobTxtController, //1
      dobTxtController, //2
      genderTxtController, //3
      addressTxtController, //4
      rtTxtController, //5
      rwTxtController, //6
      provinceTxtController, //7
      subdistrictTxtController, //8
      regencyTxtController, //9
      villageTxtController, //10
      religionTxtController, //11
      postalCodeTxtController, //12
      issuanceCityTxtController, //13
      emailTxtController, //14
      phoneNumberTxtController, //15
      phoneHouseTxtController, //16
      npwpTxtController, //17
      maritalStatusTxtController, //18
      mothersNameTxtController; //19

  Widget textEditingLabel(int i) {
    switch (i) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.namaLengkap.title,
            style: textStyleW600(fontSize: 14, fontColor: GREY),
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.tempatLahir.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.tanggalLahir.title,
            style: textStyleW600(fontSize: 14, fontColor: GREY),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.jenisKelamin.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 4:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.alamat.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 5:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.rt.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 6:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.rw.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 7:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.provonsi.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 8:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.kotaKabupaten.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 9:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.kecamatan.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 10:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.desaKelurahan.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 11:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.agama.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 12:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.kodePos.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 13:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.kotaPenerbitIndentitas.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 14:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.email.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 15:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.nomorTelepon.title,
            style: textStyleW600(fontSize: 14, fontColor: GREY),
          ),
        );
      case 16:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: RegistrationFormPrivateLabel.nomorTeleponRumah.title,
                style: textStyleW600(fontSize: 14)),
            TextSpan(
                text: " (Opsional)",
                style: textStyleW500(fontSize: 14, fontColor: GREY)),
          ])),
        );
      case 17:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: RegistrationFormPrivateLabel.nomorNpwp.title,
                style: textStyleW600(fontSize: 14)),
            TextSpan(
                text: " (Opsional)",
                style: textStyleW500(fontSize: 14, fontColor: GREY)),
          ])),
        );
      case 18:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.statusPerkawinan.title,
            style: textStyleW600(fontSize: 14),
          ),
        );
      case 19:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            RegistrationFormPrivateLabel.namaIbuKandung.title,
            style: textStyleW600(fontSize: 14),
          ),
        );

      default:
        return Container();
    }
  }

  TextEditingController? textEditingController(int i) {
    switch (i) {
      case 0:
        return fullNameTxtController;
      case 1:
        return pobTxtController;
      case 2:
        return dobTxtController;
      case 3:
        return genderTxtController;
      case 4:
        return addressTxtController;
      case 5:
        return rtTxtController;
      case 6:
        return rwTxtController;
      case 7:
        return provinceTxtController;
      case 8:
        return subdistrictTxtController;
      case 9:
        return regencyTxtController;
      case 10:
        return villageTxtController;
      case 11:
        return religionTxtController;
      case 12:
        return postalCodeTxtController;
      case 13:
        return issuanceCityTxtController;
      case 14:
        return emailTxtController;
      case 15:
        return phoneNumberTxtController;
      case 16:
        return phoneHouseTxtController;
      case 17:
        return npwpTxtController;
      case 18:
        return maritalStatusTxtController;
      case 19:
        return mothersNameTxtController;
      default:
        return null;
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
    switch (i) {
      case 3:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText:
                "Pilih ${RegistrationFormPrivateLabel.jenisKelamin.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 7:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih ${RegistrationFormPrivateLabel.provonsi.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 8:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText:
                "Pilih ${RegistrationFormPrivateLabel.kotaKabupaten.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 9:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih ${RegistrationFormPrivateLabel.kecamatan.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 11:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih ${RegistrationFormPrivateLabel.agama.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 12:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih ${RegistrationFormPrivateLabel.kodePos.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      case 18:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText:
                "Pilih ${RegistrationFormPrivateLabel.statusPerkawinan.title}",
            hintStyle: textStyleW600(fontColor: GREY));
      default:
        return null;
    }
  }

  bool readOnlyField(int i) {
    switch (i) {
      case 0:
        return true;
      case 2:
        return true;
      case 3:
        return true;
      case 7:
        return true;
      case 8:
        return true;
      case 9:
        return true;
      case 11:
        return true;
      case 12:
        return true;
      case 15:
        return true;
      case 18:
        return true;
      default:
        return false;
    }
  }

  void Function()? onFieldTap(int i) {
    switch (i) {
      case 3:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.namaLengkap.title}");
      case 7:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.provonsi.title}");
      case 8:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.kotaKabupaten.title}");
      case 9:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.kecamatan.title}");
      case 11:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.agama.title}");
      case 12:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.kodePos.title}");
      case 18:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormPrivateLabel.statusPerkawinan.title}");
      default:
        return null;
    }
  }

  final List<String> genderItems = [
    "Pria",
    "Wanita",
  ];
  final List<String> religionItems = [
    "Islam",
    "Kristen",
    "Hindu",
    "Budha",
    "Khonghucu",
  ];
  final List<String> postalCodeItems = [
    "123456",
    "789101",
    "121314",
    "389324",
    "947883",
  ];

  final List<String> maritalStatusItems = [
    "Menikah",
    "Belum Menikah",
    "Bercerai",
  ];

  List<SelectedListItem>? selectedListItem(int i) {
    switch (i) {
      case 3:
        return List.generate(
            genderItems.length, (i) => SelectedListItem(name: genderItems[i]));
      case 7:
        return List.generate(provinceList.length,
            (i) => SelectedListItem(name: provinceList[i]!.nama!));
      case 8:
        return List.generate(subDistrictList.length,
            (i) => SelectedListItem(name: subDistrictList[i]!.nama!));
      case 9:
        return List.generate(regencyList.length,
            (i) => SelectedListItem(name: regencyList[i]!.nama!));
      case 11:
        return List.generate(religionItems.length,
            (i) => SelectedListItem(name: religionItems[i]));
      case 12:
        return List.generate(postalCodeItems.length,
            (i) => SelectedListItem(name: postalCodeItems[i]));
      case 18:
        return List.generate(maritalStatusItems.length,
            (i) => SelectedListItem(name: maritalStatusItems[i]));
      default:
        return null;
    }
  }

  dynamic Function(List<dynamic>)? selectedItem(int i) {
    switch (i) {
      case 3:
        return (item) {
          genderTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onchangeForm(i)?.call(genderTxtController.text);
        };
      case 7:
        return (item) async {
          onchangeForm(i + 1)?.call("");
          onchangeForm(i + 2)?.call("");
          provinceTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findSubdistrict();
          onchangeForm(i)?.call(provinceTxtController.text);
        };
      case 8:
        return (item) async {
          onchangeForm(i + 1)?.call("");
          subdistrictTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findRegency();
          onchangeForm(i)?.call(subdistrictTxtController.text);
        };
      case 9:
        return (item) {
          onchangeForm(i + 1)?.call(subdistrictTxtController.text);
          regencyTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onchangeForm(i)?.call(regencyTxtController.text);
        };
      case 11:
        return (item) {
          religionTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onchangeForm(i)?.call(religionTxtController.text);
        };
      case 12:
        return (item) {
          postalCodeTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onchangeForm(i)?.call(postalCodeTxtController.text);
        };
      case 18:
        return (item) {
          maritalStatusTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onchangeForm(i)?.call(maritalStatusTxtController.text);
        };
      default:
        return null;
    }
  }

  Future<void> _findSubdistrict() async {
    subDistrictList.value = [];
    regencyList.value = [];
    subdistrictTxtController.clear();
    regencyTxtController.clear();
    var _i_ =
        provinceList.indexWhere((e) => e!.nama == provinceTxtController.text);
    var payload = provinceList[_i_]?.id;
    var getSubDistrict = (await Api().GET("kota?id_provinsi=$payload")
        as Map<String, dynamic>)['kota_kabupaten'] as List<dynamic>;
    subDistrictList.value = List.generate((getSubDistrict).length,
        (index) => AddressModel.fromJson(getSubDistrict[index]));
  }

  Future<void> _findRegency() async {
    regencyList.value = [];
    regencyTxtController.clear();
    var _i_ = subDistrictList
        .indexWhere((e) => e!.nama == subdistrictTxtController.text);
    var payload = subDistrictList[_i_]?.id;
    var getRegency = (await Api().GET("kecamatan?id_kota=$payload")
        as Map<String, dynamic>)['kecamatan'] as List<dynamic>;
    regencyList.value = List.generate((getRegency).length,
        (index) => AddressModel.fromJson(getRegency[index]));
  }

  void Function()? dropDownSelecting(int i, String title) {
    return () {
      DropDownState(
        DropDown(
            isSearchVisible: (i == 3 || i == 18) ? false : true,
            bottomSheetTitle: Text(title, style: textStyleW600(fontSize: 16)),
            data: selectedListItem(i)!,
            selectedItems: selectedItem(i),
            enableMultipleSelection: false,
            isExpanded: (i == 3 || i == 18) ? false : true),
      ).showModal(Get.context);
    };
  }

  TextInputType textInputType(int i) {
    switch (i) {
      case 5:
        return TextInputType.number;
      case 6:
        return TextInputType.number;
      case 16:
        return TextInputType.number;
      case 17:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  String? Function(String?)? onValidateForm(int i) {
    switch (i) {
      case 14:
        return (val) {
          if (val!.isEmpty) {
            return "${RegistrationFormPrivateLabel.values[i].title} Wajib diisi";
          } else if (!val.isValidEmail()) {
            return "Email tidak valid";
          } else {
            return null;
          }
        };
      case 15:
        return (val) {
          return null;
        };
      case 16:
        return (val) {
          if (val!.isNotEmpty && !phoneRegExp.hasMatch(val)) {
            return "Nomer Telepon tidak valid";
          }
          return null;
        };
      case 17:
        return (val) {
          if (val!.isNotEmpty && val.length != 16) {
            return "Nomor NPWP 16 digit";
          }
          return null;
        };
      default:
        return (val) {
          if (val!.isEmpty) {
            return "${RegistrationFormPrivateLabel.values[i].title} Wajib diisi";
          } else if (onlyTextRegExpAndNumber.hasMatch(val)) {
            return "Terdapat karakter tidak valid";
          }
          return null;
        };
    }
  }

  void Function(String?)? onchangeForm(int i) {
    switch (i) {
      case 14:
        return (val) {
          if (val!.isEmpty) {
            validationForm[i].value = false;
          } else if (!val.isValidEmail()) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };
      case 16:
        return (val) {
          if (val!.isNotEmpty && !phoneRegExp.hasMatch(val)) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };
      case 17:
        return (val) {
          if (val!.isNotEmpty && val.length != 16) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };

      default:
        return (val) {
          if (val == "") {
            validationForm[i].value = false;
          } else if (onlyTextRegExpAndNumber.hasMatch(val!)) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };
    }
  }

  @override
  void onInit() {
    fullNameTxtController =
        TextEditingController(text: _mController.ktpData['full_name']);
    pobTxtController = TextEditingController();
    dobTxtController = TextEditingController(text: _mController.ktpData['dob']);
    genderTxtController = TextEditingController();
    addressTxtController = TextEditingController();
    rtTxtController = TextEditingController();
    rwTxtController = TextEditingController();
    provinceTxtController = TextEditingController();
    subdistrictTxtController = TextEditingController();
    regencyTxtController = TextEditingController();
    villageTxtController = TextEditingController();
    religionTxtController = TextEditingController();
    postalCodeTxtController = TextEditingController();
    issuanceCityTxtController = TextEditingController();
    emailTxtController = TextEditingController();
    phoneNumberTxtController =
        TextEditingController(text: _mController.inputNumberData['number']);
    phoneHouseTxtController = TextEditingController();
    npwpTxtController = TextEditingController();
    maritalStatusTxtController = TextEditingController();
    mothersNameTxtController = TextEditingController();
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

  void Function()? next() {
    if (validationForm.contains(RxBool(false))) {
      return null;
    }
    return () async {
      var _payload = {
        "full_name": fullNameTxtController.text,
        "pob": pobTxtController.text,
        "dob": dobTxtController.text,
        "gender": genderTxtController.text,
        "address": addressTxtController.text,
        "rt": rtTxtController.text,
        "rw": rwTxtController.text,
        "province": provinceTxtController.text,
        "subdistrict": subdistrictTxtController.text,
        "regency": regencyTxtController.text,
        "village": villageTxtController.text,
        "religion": religionTxtController.text,
        "postal_code": postalCodeTxtController.text,
        "issuance_city": issuanceCityTxtController.text,
        "email": emailTxtController.text,
        "phone": phoneNumberTxtController.text,
        "phone_house": phoneHouseTxtController.text,
        "npwp": npwpTxtController.text,
        "marital_status": maritalStatusTxtController.text,
        "mother_name": mothersNameTxtController.text
      };
      _mController.setPrivateFormData(_payload);
      await Get.toNamed(ROUTE.registrationFormJobDetail.name);
    };
  }
}

class AddressModel {
  String? id;
  String? nama;

  AddressModel({
    this.id,
    this.nama,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    nama = json['nama']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}
