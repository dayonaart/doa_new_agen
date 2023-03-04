import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/ktp_registration_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class KtpRegistration extends StatelessWidget {
  KtpRegistration({super.key});
  final _controller = Get.put(KtpRegistrationController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: KtpRegistrationWord.registrasi.text,
                progressData: 3),
            body: PreTakeImage(),
            bottomNavigationBar: KtpRegistrationButton()));
  }
}

class KtpRegistrationButton extends StatelessWidget {
  final KtpRegistrationController _controller = Get.find();

  KtpRegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
      child: BUTTON(
          radiusCircular: 999,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              KtpRegistrationWord.lanjut.text,
              style: textStyleW600(fontSize: 16, fontColor: Colors.white),
            ),
          ),
          onPressed: _controller.next()),
    );
  }
}

class PreTakeImage extends StatelessWidget {
  PreTakeImage({super.key});
  final KtpRegistrationController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
              backgroundColor: PINK_LIGHT,
              radius: 80,
              child: Image.asset(ktpAssets)),
          const SizedBox(height: 24),
          Text(KtpRegistrationWord.verifikasieKTP.text,
              style: textStyleW600(fontSize: 16)),
          const SizedBox(height: 8),
          Text(KtpRegistrationWord.prosesIniBertujuan.text,
              style: textStyleW500(fontSize: 14), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(lampAssets),
            const SizedBox(width: 12),
            Text(KtpRegistrationWord.pastikanHasilFoto.text,
                style: textStyleW600(fontSize: 12, fontColor: BLUE_TEXT))
          ]),
          const SizedBox(height: 8),
          Text.rich(
              TextSpan(children: _controller.requirementDescriptionWidget)),
        ],
      ),
    );
  }
}
