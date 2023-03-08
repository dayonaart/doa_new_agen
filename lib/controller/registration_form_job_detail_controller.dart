import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';

class RegistrationFormJobDetailController extends GetxController {
  final MainController _mController = Get.find();
  String get data => "${_mController.privateFormData}";
  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }

  void Function()? next() {
    return () async {
      print(_mController.privateFormData);
    };
  }
}
