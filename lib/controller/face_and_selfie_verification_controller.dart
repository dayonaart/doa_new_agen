import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';

class FaceAndSelfieVericationController extends GetxController {
  final MainController _mController = Get.put(MainController());

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }
}
