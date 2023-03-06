import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_private_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormPrivate extends StatelessWidget {
  RegistrationFormPrivate({super.key});
  final _controller = Get.put(RegistrationFormPrivateController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(child: SCAFFOLD(body: Center()));
  }
}
