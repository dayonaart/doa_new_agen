import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_private_controller.dart';
import 'package:mobilenew/pages/registration_form.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
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
                      children: [
                        Column(
                          children: List.generate(_controller.totalField, (i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _controller.textEditingLabel(i),
                                TextFormField(
                                    onTap: _controller.onFieldTap(i),
                                    decoration: _controller.inputDecoration(i),
                                    style: textStyleW500(
                                        fontSize: 16,
                                        fontColor: _controller.readOnlyField(i)
                                            ? GREY
                                            : Colors.black),
                                    readOnly: _controller.readOnlyField(i),
                                    controller:
                                        _controller.textEditingController(i)),
                                const SizedBox(height: 16),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 59),
                        BUTTON(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "Lanjut",
                                style: textStyleW600(fontColor: Colors.white),
                              ),
                            ),
                            onPressed: _controller.test(),
                            radiusCircular: 999),
                        const SizedBox(height: 39),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
