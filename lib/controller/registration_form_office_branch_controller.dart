import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';

class RegistrationFormOfficeBranchController extends GetxController {
  final MainController _mController = Get.find();
  String get data => "${_mController.jobDetailFormData}";
  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }
}
