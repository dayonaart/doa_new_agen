import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/registration_form_office_branch_controller.dart';
import 'package:mobilenew/widget/widgets.dart';

class RegistrationFormOfficeBranch extends StatelessWidget {
  RegistrationFormOfficeBranch({super.key});
  // ignore: unused_field
  final _controller = Get.put(RegistrationFormOfficeBranchController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Registrasi",
                progressData: 6),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(_controller.data),
              ),
            )));
  }
}
