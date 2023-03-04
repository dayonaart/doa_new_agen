import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({super.key});
  final _controller = Get.put(RegistrationFormController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(onPressed: () => Get.back(), title: "Registrasi"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),
                  // Obx(() {
                  //   return Text("${_controller.extractedText}");
                  //   return Column(
                  //     children:
                  //         List.generate(_controller.imageText.length, (i) {
                  //       return Text("${_controller.imageText[i]}");
                  //     }),
                  //   );
                  // }),
                  Image.file(
                    File(_controller.ktpPath),
                    fit: BoxFit.cover,
                  ),
                  BUTTON(
                      child: const Text("data"),
                      onPressed: _controller.processExtractText())
                ],
              ),
            )));
  }
}
