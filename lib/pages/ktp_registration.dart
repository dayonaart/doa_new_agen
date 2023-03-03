import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/ktp_registration_controller.dart';
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
                title: "Registrasi",
                progressData: 3),
            body: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            )));
  }
}
