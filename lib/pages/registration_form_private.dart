import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_private_controller.dart';
import 'package:mobilenew/pages/registration_form.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormPrivate extends StatelessWidget {
  RegistrationFormPrivate({super.key});
  final _controller = Get.put(RegistrationFormPrivateController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Registrasi",
                progressData: 4),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const RegistrationFormHeader(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: List.generate(_controller.totalField, (i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _controller.textEditingLabel(i),
                            TextFormField(
                                controller:
                                    _controller.textEditingController(i)),
                            const SizedBox(height: 16),
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            )));
  }
}
