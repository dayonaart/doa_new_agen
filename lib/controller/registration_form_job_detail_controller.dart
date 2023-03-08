import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'dart:math' as math;

class RegistrationFormJobDetailController extends GetxController {
  final MainController _mController = Get.find();
  String get data => "${_mController.privateFormData}";
  List<RxBool> validationForm =
      List.generate(RegistrationFormJobDetailLabel.values.length, (i) {
    switch (i != 7) {
      case true:
        return RxBool(false);
      case false:
        return RxBool(true);
      default:
        return RxBool(false);
    }
  });
  late TextEditingController jobTxtController, //0
      monthlyIncomeTxtController, //1
      sourceFundsTxtController, //2
      estimatedTransactionTxtController, //3
      purposeOpeningAccountTxtController, //4
      jobPositionTxtController, //5
      workPlaceNameTxtController, //6
      workPlacePhoneTxtController, //7
      workPlaceAddressTxtController, //8
      postalCodeTxtController; //9
  List<String> jobList = [
    "Guru",
    "Programmer",
    "Artificial Intelligence (AI) Engineer",
    "Dokter",
    "Pilot",
    "Nahkoda",
    "Pengacara",
    "Hakim",
    "Jaksa",
    "Polisi",
    "Bidan",
    "Akuntan",
    "Dosen",
    "Perawat",
    "Tentara",
    "Arsitek",
    "Apoteker",
    "Media Sosial Officer",
    "Content Creator",
    "Youtuber",
    "Tiktoker",
    "Selebgram",
    "Petani",
    "Nelayan",
    "Tukang Becak",
    "Penjaga Toko",
    "Pedagang",
    "Kondektur",
    "Aktor",
    "Model",
    "Novelis",
    "Penyanyi",
  ];
  List<String> incomeList = [
    "Rp 2 Juta s/d 4 Juta",
    "Rp 4 Juta s/d 6 Juta",
    "Rp 6 Juta s/d 8 Juta",
    "Rp 8 Juta s/d 12 Juta",
    "Rp 12 Juta s/d 20 Juta",
    "Rp 20 Juta s/d 30 Juta",
    "Rp 30 Juta s/d 50 Juta",
    "Rp 50 Juta s/d 70 Juta",
    "Rp 70 Juta s/d 100 Juta",
  ];

  List<String> sourceFundList = [
    "Tabungan pribadi",
    "Teman atau keluarga",
    "Angel investor",
    "Crowdfunding",
    "Pesangon",
    "Venture capital",
    "Hadiah kompetisi bisnis",
    "Pinjaman KUR (Kredit Usaha Rakyat)",
    "Hasil Investasi Bodong",
  ];
  List<String> estimatedTransactionList = [
    ">= Rp 100 Juta",
    ">= Rp 200 Juta",
    ">= Rp 300 Juta",
    ">= Rp 400 Juta",
    ">= Rp 500 Juta",
    ">= Rp 600 Juta",
    ">= Rp 700 Juta",
    ">= Rp 800 Juta",
    ">= Rp 900 Juta",
  ];
  List<String> purposeOpeningAccountList = [
    "persiapan dana darurat",
    "persiapan dana liburan",
    "dana pendidikan",
    "lainnya",
  ];

  List<SelectedListItem>? selectedListItem(int i) {
    switch (i) {
      case 0:
        return List.generate(
            jobList.length, (i) => SelectedListItem(name: jobList[i]));

      case 1:
        return List.generate(
            incomeList.length, (i) => SelectedListItem(name: incomeList[i]));
      case 2:
        return List.generate(sourceFundList.length,
            (i) => SelectedListItem(name: sourceFundList[i]));
      case 3:
        return List.generate(estimatedTransactionList.length,
            (i) => SelectedListItem(name: estimatedTransactionList[i]));
      case 4:
        return List.generate(purposeOpeningAccountList.length,
            (i) => SelectedListItem(name: purposeOpeningAccountList[i]));
      default:
        return null;
    }
  }

  dynamic Function(List<dynamic>)? selectedItem(int i) {
    switch (i) {
      case 0:
        return (item) {
          jobTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(jobTxtController.text);
        };
      case 1:
        return (item) {
          monthlyIncomeTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(monthlyIncomeTxtController.text);
        };
      case 2:
        return (item) {
          sourceFundsTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(sourceFundsTxtController.text);
        };
      case 3:
        return (item) {
          estimatedTransactionTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(estimatedTransactionTxtController.text);
        };
      case 4:
        return (item) {
          purposeOpeningAccountTxtController.text =
              item.map((e) => (e as SelectedListItem).name).first;
          onChangeForm(i)?.call(purposeOpeningAccountTxtController.text);
        };
      default:
        return null;
    }
  }

  void Function()? dropDownSelecting(int i, String title) {
    return () {
      DropDownState(
        DropDown(
            isSearchVisible: true,
            bottomSheetTitle: Text(title, style: textStyleW600(fontSize: 16)),
            data: selectedListItem(i)!,
            selectedItems: selectedItem(i),
            enableMultipleSelection: false,
            isExpanded: selectedListItem(i)!.length <= 4 ? false : true),
      ).showModal(Get.context);
    };
  }

  TextEditingController? textEditingController(int i) {
    switch (i) {
      case 0:
        return jobTxtController;
      case 1:
        return monthlyIncomeTxtController;
      case 2:
        return sourceFundsTxtController;
      case 3:
        return estimatedTransactionTxtController;
      case 4:
        return purposeOpeningAccountTxtController;
      case 5:
        return jobPositionTxtController;
      case 6:
        return workPlaceNameTxtController;
      case 7:
        return workPlacePhoneTxtController;
      case 8:
        return workPlaceAddressTxtController;
      case 9:
        return postalCodeTxtController;
      default:
        return null;
    }
  }

  Widget textEditingLabel(int i) {
    switch (i) {
      case 0:
        return Text(
          RegistrationFormJobDetailLabel.pekerjaan.title,
          style: textStyleW600(fontSize: 14),
        );
      case 1:
        return Text(
          RegistrationFormJobDetailLabel.penghasilanPerbulan.title,
          style: textStyleW600(fontSize: 14),
        );
      case 2:
        return Text(
          RegistrationFormJobDetailLabel.sumberDana.title,
          style: textStyleW600(fontSize: 14),
        );
      case 3:
        return Text.rich(TextSpan(children: [
          TextSpan(
              text:
                  RegistrationFormJobDetailLabel.perkiraanNilaiTransaksi.title,
              style: textStyleW600(fontSize: 14)),
          TextSpan(text: " (per tahun)", style: textStyleW500(fontSize: 14)),
        ]));

      case 4:
        return Text(
          RegistrationFormJobDetailLabel.tujuanPembukaanRekening.title,
          style: textStyleW600(fontSize: 14),
        );
      case 5:
        return Text(
          RegistrationFormJobDetailLabel.jabatan.title,
          style: textStyleW600(fontSize: 14),
        );
      case 6:
        return Text(
          RegistrationFormJobDetailLabel.namaTempatKerjaPerusahaan.title,
          style: textStyleW600(fontSize: 14),
        );
      case 7:
        return Text.rich(TextSpan(children: [
          TextSpan(
              text: RegistrationFormJobDetailLabel.noTeleponTempatBekerja.title,
              style: textStyleW600(fontSize: 14)),
          TextSpan(
              text: " (Opsional)",
              style: textStyleW500(fontSize: 14, fontColor: GREY)),
        ]));

      case 8:
        return Text(
          RegistrationFormJobDetailLabel.alamatTempatKerja.title,
          style: textStyleW600(fontSize: 14),
        );
      case 9:
        return Text(
          RegistrationFormJobDetailLabel.kodePos.title,
          style: textStyleW600(fontSize: 14),
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
    switch (i <= 4) {
      case true:
        return InputDecoration(
            suffixIcon: suffixIcon(),
            hintText: "Pilih ${RegistrationFormJobDetailLabel.values[i].title}",
            hintStyle: textStyleW500(fontColor: GREY, fontSize: 16));
      default:
        return null;
    }
  }

  TextInputType? textInputType(int i) {
    switch (i == 7 || i == 9) {
      case true:
        return TextInputType.number;
      case false:
        return TextInputType.text;
      default:
        return null;
    }
  }

  void Function()? onFieldTap(int i) {
    switch (i <= 4) {
      case true:
        return dropDownSelecting(
            i, "Pilih ${RegistrationFormJobDetailLabel.values[i].title}");
      case false:
        return null;
      default:
        return null;
    }
  }

  String? Function(String?)? onValidatedForm(int i) {
    switch (i <= 4) {
      case true:
        return (val) {
          if (val!.isEmpty) {
            return "${RegistrationFormJobDetailLabel.values[i].title} Wajib diisi";
          }
          return null;
        };
      case false:
        if (i == 7) {
          return (val) {
            if (val!.isNotEmpty && !val.isValidPhone()) {
              return "Nomer Telepon tidak valid";
            }
            return null;
          };
        }
        return (val) {
          if (val!.isEmpty) {
            return "${RegistrationFormJobDetailLabel.values[i].title} Wajib diisi";
          }
          return null;
        };
      default:
        return null;
    }
  }

  void Function(String)? onChangeForm(int i) {
    switch (i <= 4) {
      case true:
        return (val) {
          if (val.isEmpty) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };
      case false:
        if (i == 7) {
          return (val) {
            if (val.isNotEmpty && !val.isValidPhone()) {
              validationForm[i].value = false;
            } else {
              validationForm[i].value = true;
            }
          };
        }
        return (val) {
          if (val.isEmpty) {
            validationForm[i].value = false;
          } else {
            validationForm[i].value = true;
          }
        };
      default:
        return null;
    }
  }

  bool readOnly(int i) {
    switch (i <= 4) {
      case true:
        return true;
      case false:
        return false;
      default:
        return false;
    }
  }

  @override
  void onInit() {
    jobTxtController = TextEditingController();
    monthlyIncomeTxtController = TextEditingController();
    sourceFundsTxtController = TextEditingController();
    estimatedTransactionTxtController = TextEditingController();
    purposeOpeningAccountTxtController = TextEditingController();
    jobPositionTxtController = TextEditingController();
    workPlaceNameTxtController = TextEditingController();
    workPlacePhoneTxtController = TextEditingController();
    workPlaceAddressTxtController = TextEditingController();
    postalCodeTxtController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }

  void Function()? next() {
    if (validationForm.contains(RxBool(false))) {
      return null;
    } else {
      return () async {
        var _payload = {
          "job": jobPositionTxtController.text,
          "monthly_income": monthlyIncomeTxtController.text,
          "source_funds": sourceFundsTxtController.text,
          "estimated_transaction": estimatedTransactionTxtController.text,
          "purpose_account": purposeOpeningAccountTxtController.text,
          "job_position": jobPositionTxtController.text,
          "work_place_name": workPlaceNameTxtController.text,
          "work_place_phone": workPlacePhoneTxtController.text,
          "work_place_address": workPlaceAddressTxtController.text,
          "postal_code": postalCodeTxtController.text
        };
        _mController.setJobDetailFormData(_payload);
        await Get.toNamed(ROUTE.registrationFormOfficeBranch.name);
      };
    }
  }
}
