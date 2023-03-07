import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/api/api.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'dart:math' as math;

class RegistrationFormPrivateController extends GetxController {
  final MainController _mController = Get.find();
  RxList<AddressModel?> provinceList = RxList();
  RxList<AddressModel?> subDistrictList = RxList();
  RxList<AddressModel?> regencyList = RxList();
  int totalField = 20;
  late TextEditingController fullNameTxtController,
      pobTxtController,
      dobTxtController,
      genderTxtController,
      addressTxtController,
      rtTxtController,
      rwTxtController,
      provinceTxtController,
      subdistrictTxtController,
      regencyTxtController,
      villageTxtController,
      religionTxtController,
      postalCodoTxtController,
      issuanceCityTxtController,
      emailTxtController,
      phoneNumberTxtController,
      phoneHouseTxtController,
      npwpTxtController,
      maritalStatusTxtController,
      mothersNameTxtController;

  Widget textEditingLabel(int i) {
    switch (i) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Nama Lengkap",
            style: textStyleW600(fontSize: 16, fontColor: GREY),
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Tempat Lahir",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Tanggal Lahir",
            style: textStyleW600(fontSize: 16, fontColor: GREY),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Jenis Kelamin",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 4:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Alamat",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 5:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "RT",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 6:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "RW",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 7:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "PROVINSI",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 8:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Kota / Kabupaten",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 9:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Kecamatan",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 10:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Desa / Kelurahan",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 11:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Agama",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 12:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Kode Pos",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 13:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Kota Penerbit Identitas",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 14:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Email",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 15:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Nomor Telepon",
            style: textStyleW600(fontSize: 16, fontColor: GREY),
          ),
        );
      case 16:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: "Nomor Telepon Rumah ",
                style: textStyleW600(fontSize: 16)),
            TextSpan(
                text: "(Opsional)",
                style: textStyleW500(fontSize: 16, fontColor: GREY)),
          ])),
        );
      case 17:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: "Nomor NPWP ", style: textStyleW600(fontSize: 16)),
            TextSpan(
                text: "(Opsional)",
                style: textStyleW500(fontSize: 16, fontColor: GREY)),
          ])),
        );
      case 18:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Status Perkawinan",
            style: textStyleW600(fontSize: 16),
          ),
        );
      case 19:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            "Nama Ibu Kandung",
            style: textStyleW600(fontSize: 16),
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
        return postalCodoTxtController;
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
            hintText: "Pilih Jenis Kelamin",
            hintStyle: textStyleW600(fontColor: GREY));
      case 7:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih Provinsi",
            hintStyle: textStyleW600(fontColor: GREY));
      case 8:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih Kota / Kabupaten",
            hintStyle: textStyleW600(fontColor: GREY));
      case 9:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih Kecamatan",
            hintStyle: textStyleW600(fontColor: GREY));
      case 11:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih Agama",
            hintStyle: textStyleW600(fontColor: GREY));
      case 12:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih Kode Pos",
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
      default:
        return false;
    }
  }

  void Function()? onFieldTap(int i) {
    switch (i) {
      case 3:
        return dropDownSelecting(i, "Pilih Jenis Kelamin");
      case 7:
        return dropDownSelecting(i, "Pilih Provinsi");
      case 8:
        return dropDownSelecting(i, "Pilih Kota / Kabupaten");
      default:
        return null;
    }
  }

  final List<String> genderItems = ["Laki-Laki", "Perempuan"];

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
        };
      case 7:
        return (item) async {
          provinceTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findSubdistrict();
        };
      case 8:
        return (item) async {
          subdistrictTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          await _findRegency();
        };
      case 9:
        return (item) {
          regencyTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
        };
      default:
        return null;
    }
  }

  Future<void> _findSubdistrict() async {
    var _i_ =
        provinceList.indexWhere((e) => e!.nama == provinceTxtController.text);
    var payload = provinceList[_i_]?.id;
    var getSubDistrict = await Api().GET("kabupaten/$payload.json");
    subDistrictList.value = List.generate(
        (getSubDistrict as List<dynamic>).length,
        (index) => AddressModel.fromJson(getSubDistrict[index]));
  }

  Future<void> _findRegency() async {
    var _i_ = subDistrictList
        .indexWhere((e) => e!.nama == subdistrictTxtController.text);
    var payload = subDistrictList[_i_]?.id;
    print(payload);
    // var getRegency = await Api().GET("kabupaten/$payload.json");
    // regencyList.value = List.generate((getRegency as List<dynamic>).length,
    //     (index) => AddressModel.fromJson(getRegency[index]));
  }

  void Function()? dropDownSelecting(int i, String title) {
    return () {
      DropDownState(
        DropDown(
          isSearchVisible: i == 3 ? false : true,
          bottomSheetTitle: Text(title, style: textStyleW600(fontSize: 16)),
          data: selectedListItem(i)!,
          selectedItems: selectedItem(i),
          enableMultipleSelection: false,
        ),
      ).showModal(Get.context);
    };
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
    postalCodoTxtController = TextEditingController();
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
    var _province = await Api().GET("provinsi.json");
    provinceList.value = List.generate((_province as List<dynamic>).length,
        (index) => AddressModel.fromJson(_province[index]));
    super.onReady();
  }

  void Function() test() {
    return () async {
      print(subDistrictList.map((element) => element?.toJson()).toList());
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
