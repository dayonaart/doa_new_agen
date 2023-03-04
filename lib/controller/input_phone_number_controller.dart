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
  RxBool numberValidation = false.obs;
  RxBool helperValidation = false.obs;
  RxString selectedCountry = InputPhoneNumberWord.negara.text.obs;
  final _mController = Get.put(MainController());

  @override
  void onInit() {
    _mController.startProgressAnim();
    super.onInit();
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
        ),
      ).showModal(context);
    };
  }

  void Function(String)? onInputNumberChanged() {
    return (val) {
      if (val.isEmpty) {
        numberValidation.value = false;
        helperValidation.value = false;
      } else if (val.length <= 10 || val.length > 12) {
        helperValidation.value = true;
        numberValidation.value = false;
      } else {
        helperValidation.value = false;
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
        print(
            "{'number':${numberEditingController.text},'country':${selectedCountry.value}}");
        await Get.toNamed(ROUTE.accountType.name);
      };
    } else {
      return null;
    }
  }
}
