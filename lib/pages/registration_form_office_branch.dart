import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_office_branch_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormOfficeBranch extends StatelessWidget {
  RegistrationFormOfficeBranch({super.key});
  final _controller = Get.put(RegistrationFormOfficeBranchController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(child: SCAFFOLD(body: Center()));
  }
}
