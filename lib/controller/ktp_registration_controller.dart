import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mobilenew/controller/main_controller.dart';

class KtpRegistrationController extends GetxController {
  final MainController _mainController = Get.find();

  @override
  void onReady() {
    _mainController.startProgressAnim();
    super.onReady();
  }
}
