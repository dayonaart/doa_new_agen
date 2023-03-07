import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
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
                  child: Obx(() {
                    return BUTTON(
                        radiusCircular: 999,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text("Lanjut",
                                style: textStyleW600(fontSize: 16))),
                        onPressed: _controller.next());
                  }),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (i == 3)
                        Column(
                          children: [
                            const SizedBox(height: 24),
                            Container(color: GREY_BACKGROUND, height: 8),
                            const SizedBox(height: 24)
                          ],
                        ),
                      _controller.textEditingLabel(i),
                      Obx(() {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: i == 2,
                          onTap: i != 2 ? null : _controller.datePicker(),
                          keyboardType: _controller.textInputType(i),
                          onChanged: _controller.formOnChange(i),
                          validator: _controller.formValidator(i),
                          enabled: _controller.enableEditing.value,
                          style: textStyleW500(fontSize: 16),
                          controller: _controller.textController(i),
                          decoration: InputDecoration(
                              suffixIcon: _controller.suffixHelperWidget(i),
                              border: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 0.5, color: GREY)),
                              floatingLabelStyle: textStyleW600(fontSize: 14),
                              labelStyle: textStyleW600(fontSize: 14)),
                        );
                      })
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
        Obx(() {
          return _controller.ktpWidget.value;
        }),
        const SizedBox(height: 20),
        OUTLINE_BUTTON(
            radiusCircular: 999,
            mainAxisSize: MainAxisSize.min,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.5, vertical: 4),
              child: Row(
                children: [
                  ImageIcon(AssetImage(penAssets), color: ORANGE),
                  const SizedBox(width: 6.27),
                  Text("Ubah",
                      style: textStyleW500(fontSize: 14, fontColor: ORANGE))
                ],
              ),
            ),
            onPressed: _controller.enableOnEditTextField()),
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
                  ImageIcon(AssetImage(iAssets), color: BLUE_TEXT),
                  const SizedBox(width: 13.67),
                  Expanded(
                      child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Pastikan semua data diri",
                        style:
                            textStyleW500(fontSize: 12, fontColor: BLUE_TEXT)),
                    TextSpan(
                        text: " sudah sesuai dengan e-KTP Anda!",
                        style:
                            textStyleW600(fontSize: 12, fontColor: BLUE_TEXT)),
                  ]))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
