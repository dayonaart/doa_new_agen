import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/widget/widgets.dart';

class InputPhoneNumberController extends GetxController {
  final TextEditingController numberEditingController = TextEditingController();
  RxBool numberValidation = RxBool(false);

  RxString selectedCountry = InputPhoneNumberWord.negara.text.obs;
  final MainController _mController = Get.find();

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }

  final List<String> items = [
    InputPhoneNumberWord.indonesia.text,
    InputPhoneNumberWord.singapore.text,
    InputPhoneNumberWord.thailand.text,
    InputPhoneNumberWord.brunei.text,
    InputPhoneNumberWord.india.text,
    InputPhoneNumberWord.china.text,
    InputPhoneNumberWord.vietnam.text,
    InputPhoneNumberWord.uSA.text,
  ];
  List<SelectedListItem> get selectedListItem {
    return List.generate(items.length, (i) => SelectedListItem(name: items[i]));
  }

  selectedItem(List<dynamic> item) {
    selectedCountry.value = item.map((e) => (e as SelectedListItem).name).first;
  }

  void Function()? selectingCountry(BuildContext context) {
    return () {
      DropDownState(
        DropDown(
            bottomSheetTitle: Text(
              InputPhoneNumberWord.pilihNegara.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            submitButtonChild: Text(
              InputPhoneNumberWord.selesai.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            data: selectedListItem,
            selectedItems: (s) => selectedItem(s.map((e) => e).toList()),
            enableMultipleSelection: false,
            isExpanded: false),
      ).showModal(context);
    };
  }

  String? Function(String?)? phoneNumberValidator() {
    return (val) {
      if (val!.isEmpty) {
        return "Nomor Handphone wajib diisi";
      } else if (!val.isValidPhone()) {
        return "Pastikan Nomor Handphone Anda sudah benar";
      } else {
        return null;
      }
    };
  }

  void Function(String?) phoneNumberOnChange() {
    return (val) {
      if (val!.isEmpty) {
        numberValidation.value = false;
      } else if (!val.isValidPhone()) {
        numberValidation.value = false;
      } else {
        numberValidation.value = true;
      }
    };
  }

  IconButton get suffixHelperInputButton {
    return IconButton(
      onPressed: () async {
        await DIALOG_HELPER(
            InputPhoneNumberWord.pastikanNomorHandphoneDialog.text);
      },
      icon: const Icon(Icons.help, color: ORANGE),
      iconSize: 20,
    );
  }

  void Function()? next() {
    if (numberValidation.value &&
        selectedCountry.value != InputPhoneNumberWord.negara.text) {
      return () async {
        final _payload = {
          "number": numberEditingController.text,
          "country": selectedCountry.value
        };
        _mController.setInputNumberData(_payload);
        await Get.toNamed(ROUTE.accountType.name);
      };
    } else {
      return null;
    }
  }
}
