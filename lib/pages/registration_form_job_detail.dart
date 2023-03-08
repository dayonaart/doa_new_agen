import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/registration_form_job_detail_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormJobDetail extends StatelessWidget {
  RegistrationFormJobDetail({super.key});
  // ignore: unused_field
  final _controller = Get.put(RegistrationFormJobDetailController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      appBar: APPBAR(
          onPressed: () => Get.back(), title: "Registrasi", progressData: 5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text("Data Pekerjaan", style: textStyleW600(fontSize: 14)),
            ),
            const SizedBox(height: 8),
            RegistrationFormJobDetailField(),
            Padding(
                padding: const EdgeInsets.only(
                    top: 59, bottom: 39, right: 16, left: 16),
                child: Obx(() {
                  return BUTTON(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Lanjut",
                          style: textStyleW600(fontColor: Colors.white),
                        ),
                      ),
                      onPressed: _controller.next(),
                      radiusCircular: 999);
                })),
          ],
        ),
      ),
    ));
  }
}

class RegistrationFormJobDetailField extends StatelessWidget {
  final RegistrationFormJobDetailController _controller = Get.find();

  RegistrationFormJobDetailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(RegistrationFormJobDetailLabel.values.length, (i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (i == 5)
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
                      "Detail Pekerjaan",
                      style: textStyleW600(fontSize: 14),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _controller.textEditingLabel(i),
                  const SizedBox(height: 8),
                  TextFormField(
                      readOnly: _controller.readOnly(i),
                      onTap: _controller.onFieldTap(i),
                      autovalidateMode: AutovalidateMode.always,
                      validator: _controller.onValidatedForm(i),
                      decoration: _controller.inputDecoration(i),
                      onChanged: _controller.onChangeForm(i),
                      keyboardType: _controller.textInputType(i),
                      controller: _controller.textEditingController(i)),
                  if (i == 5)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: BLUE_LIGHT,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13.67, vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage(iAssets), color: BLUE_TEXT),
                              const SizedBox(width: 13.67),
                              Expanded(
                                child: Text(
                                    "Diisi keterangan pekerjaan saat ini seperti jabatan, posisi pekerjaan atau keterangan lainnya berkaitan dengan pekerjaan yang dipilih.",
                                    style: textStyleW500(
                                        fontSize: 12, fontColor: BLUE_TEXT)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
