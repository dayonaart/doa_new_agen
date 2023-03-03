import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/pages/take_camera_ktp.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class TakeCameraKtpController extends GetxController
    with WidgetsBindingObserver {
  late List<CameraDescription> _cameras;
  late CameraController? camController;
  RxBool isCameraReady = false.obs;
  final MainController _mController = Get.find();
  String cameraHelperDescription =
      "Pastikan posisi & dan klik ambil foto. Pastikan foto terlihat dengan jelas.";
  List<TextSpan> get cameraHelperDescriptionWidget {
    return cameraHelperDescription.split("").map((e) {
      if (RegExp(r'[&]', caseSensitive: true).hasMatch(e)) {
        return TextSpan(
            text: "KTP asli pada area yang tersedia",
            style: textStyleW600(fontSize: 12, fontColor: BLUE_TEXT));
      } else {
        return TextSpan(
            text: e, style: textStyleW500(fontSize: 12, fontColor: BLUE_TEXT));
      }
    }).toList();
  }

  void _initCameraController() async {
    camController = CameraController(_cameras[0], ResolutionPreset.high);
    await camController?.initialize().then((_) {
      isCameraReady.value = (camController != null);
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            DIALOG_HELPER("CameraAccessDenied");
            break;
          default:
            DIALOG_HELPER("errors $e");
            break;
        }
      }
    });
  }

  void Function() changeCameraDirection() {
    return () {
      if (camController?.description.name == "1") {
        onNewCameraSelected(_cameras[0]);
      } else {
        onNewCameraSelected(_cameras[1]);
      }
    };
  }

  void Function() takePicture() {
    return () async {
      var _xFile = await camController?.takePicture();
      if (_xFile != null) {
        await Get.to(PreviewKtp(imagePath: _xFile.path));
      } else {
        return;
      }
    };
  }

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = camController;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onReady() {
    _mController.startProgressAnim();
    _initCameraController();
    super.onReady();
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final CameraController? oldController = camController;
    if (oldController != null) {
      camController = null;
      await oldController.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: true,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    camController = cameraController;
    cameraController.addListener(() {
      if (cameraController.value.hasError) {
        DIALOG_HELPER(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          DIALOG_HELPER('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          DIALOG_HELPER('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
          // iOS only
          DIALOG_HELPER('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          DIALOG_HELPER('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          DIALOG_HELPER('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
          // iOS only
          DIALOG_HELPER('Audio access is restricted.');
          break;
        default:
          DIALOG_HELPER('CAMERA EXCEPTION $e');

          break;
      }
    }
  }
}
