import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';

class RegistrationFormPrivateController extends GetxController {
  final MainController _mController = Get.find();
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
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }
}
