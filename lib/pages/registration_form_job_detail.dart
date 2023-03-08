import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_job_detail_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormJobDetail extends StatelessWidget {
  RegistrationFormJobDetail({super.key});
  final _controller = Get.put(RegistrationFormJobDetailController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_controller.data),
      )),
    ));
  }
}
