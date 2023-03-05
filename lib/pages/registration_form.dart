import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({super.key});
  final _controller = Get.put(RegistrationFormController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Registrasi",
                progressData: 3),
            body: SingleChildScrollView(
                child: Column(
              children: [
                const RegistrationFormHeader(),
                RegistrationFormEditKtp(),
                RegistrationFormField(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
                  child: BUTTON(
                      radiusCircular: 999,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Lanjut",
                          style: textStyleW600(fontSize: 16),
                        ),
                      ),
                      onPressed: _controller.test()),
                )
              ],
            ))));
  }
}

class RegistrationFormField extends StatelessWidget {
  final RegistrationFormController _controller = Get.find();

  RegistrationFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (i == 3) {
                  return Column(
                    children: [
                      Container(color: GREY_BACKGROUND, height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            _controller.textEditingLabel(i),
                            TextField(
                              style: textStyleW500(fontSize: 16),
                              controller: _controller.textController(i),
                              decoration: InputDecoration(
                                  suffixIcon: i == 2
                                      ? const Icon(Icons.date_range,
                                          color: ORANGE)
                                      : null,
                                  border: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 0.5, color: GREY)),
                                  floatingLabelStyle:
                                      textStyleW600(fontSize: 14),
                                  labelStyle: textStyleW600(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _controller.textEditingLabel(i),
                      TextField(
                        style: textStyleW500(fontSize: 16),
                        controller: _controller.textController(i),
                        decoration: InputDecoration(
                            suffixIcon: i == 2
                                ? const Icon(Icons.date_range, color: ORANGE)
                                : null,
                            border: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: GREY)),
                            floatingLabelStyle: textStyleW600(fontSize: 14),
                            labelStyle: textStyleW600(fontSize: 14)),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}

class RegistrationFormEditKtp extends StatelessWidget {
  final RegistrationFormController _controller = Get.find();

  RegistrationFormEditKtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          width: Get.width / 2,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.file(File(_controller.ktpPath), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        OUTLINE_BUTTON(
            radiusCircular: 999,
            mainAxisSize: MainAxisSize.min,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.5, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.draw_outlined, color: ORANGE),
                  const SizedBox(width: 6.27),
                  Text(
                    "Ubah",
                    style: textStyleW500(fontSize: 14, fontColor: ORANGE),
                  )
                ],
              ),
            ),
            onPressed: () {}),
      ],
    );
  }
}

class RegistrationFormHeader extends StatelessWidget {
  const RegistrationFormHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Data E-KTP", style: textStyleW600(fontSize: 14)),
          const SizedBox(height: 8),
          Card(
            color: BLUE_LIGHT,
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 13.67),
              child: Row(
                children: [
                  const Icon(Icons.help, color: BLUE_TEXT),
                  const SizedBox(width: 13.67),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Pastikan semua data diri",
                          style: textStyleW500(
                              fontSize: 12, fontColor: BLUE_TEXT)),
                      TextSpan(
                          text: " sudah sesuai dengan e-KTP Anda!",
                          style: textStyleW600(
                              fontSize: 12, fontColor: BLUE_TEXT)),
                    ])),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
