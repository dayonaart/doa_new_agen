import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_private_controller.dart';
import 'package:mobilenew/enum.dart';
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
                  PrivateRegistrationField()
                ],
              ),
            )));
  }
}

class PrivateRegistrationField extends StatelessWidget {
  final RegistrationFormPrivateController _controller = Get.find();

  PrivateRegistrationField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children:
              List.generate(RegistrationFormPrivateLabel.values.length, (i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 14)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          height: 8,
                          color: GREY_BACKGROUND),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 16, right: 16, left: 16),
                        child: Text(
                          "Data Pribadi",
                          style: textStyleW600(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Builder(builder: (context) {
                        if (i == 5) {
                          return PrivateRegistrationRtRwField(i);
                        } else if (i == 6) {
                          return Container();
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _controller.textEditingLabel(i),
                              TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: _controller.onValidateForm(i),
                                  onChanged: _controller.onchangeForm(i),
                                  keyboardType: _controller.textInputType(i),
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
                            ],
                          );
                        }
                      }),
                      const SizedBox(height: 16),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 59, bottom: 39, right: 16, left: 16),
          child: Obx(() => BUTTON(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Lanjut",
                  style: textStyleW600(fontColor: Colors.white),
                ),
              ),
              onPressed: _controller.next(),
              radiusCircular: 999)),
        ),
      ],
    );
  }
}

class PrivateRegistrationRtRwField extends StatelessWidget {
  final int i;
  PrivateRegistrationRtRwField(this.i, {super.key});

  final RegistrationFormPrivateController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        2,
        (index) {
          return SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _controller.textEditingLabel(index == 0 ? i : 6),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: _controller.onValidateForm(index == 0 ? i : 6),
                      onChanged: _controller.onchangeForm(index == 0 ? i : 6),
                      keyboardType: _controller.textInputType(i),
                      onTap: _controller.onFieldTap(index == 0 ? i : 6),
                      decoration:
                          _controller.inputDecoration(index == 0 ? i : 6),
                      style: textStyleW500(fontSize: 16),
                      controller: _controller
                          .textEditingController(index == 0 ? i : 6)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
