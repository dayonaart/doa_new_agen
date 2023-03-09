import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/pages/take_camera_ktp.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class TakeCameraKtpController extends GetxController
    with WidgetsBindingObserver {
  late List<CameraDescription> _cameras;
  late CameraController? camController;
  bool isCameraReady = false;
  final MainController _mController = Get.find();
  String scannedText = "";
  final cameraPrev = GlobalKey();
  double boxHeight = 248;
  double boxWidth = 365;
  double previewAspectRatio = 0.5;

  List<TextSpan> get cameraHelperDescriptionWidget {
    return TakeCameraKtpWord.pastikanPosisi.text.split("").map((e) {
      if (RegExp(r'[&]', caseSensitive: true).hasMatch(e)) {
        return TextSpan(
            text: TakeCameraKtpWord.ktpAsli.text,
            style: textStyleW600(fontSize: 12, fontColor: BLUE_TEXT));
      } else {
        return TextSpan(
            text: e, style: textStyleW500(fontSize: 12, fontColor: BLUE_TEXT));
      }
    }).toList();
  }

  Future<void> _initCameraController(CameraDescription description) async {
    camController = CameraController(description, ResolutionPreset.high);
    await camController?.initialize().then((_) {
      isCameraReady = (camController != null);
      update();
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
    return () async {
      final lensDirection = camController?.description.lensDirection;
      CameraDescription newDescription;
      if (lensDirection == CameraLensDirection.front) {
        newDescription = _cameras.firstWhere((description) =>
            description.lensDirection == CameraLensDirection.back);
      } else {
        newDescription = _cameras.firstWhere((description) =>
            description.lensDirection == CameraLensDirection.front);
      }
      await _initCameraController(newDescription);
    };
  }

  void Function() takePicture() {
    return () async {
      try {
        var _xFile = await camController?.takePicture();
        if (_xFile != null) {
          _mController.setKtpFilePath(_xFile.path);
          Get.to(PreviewKtp());
          await BOTTOM_DIALOG_CONFIRMATION(
              btnAccTitle: TakeCameraKtpWord.fotoSudahSesuai.text,
              btnRejectTitle: TakeCameraKtpWord.fotoUlang.text,
              topTitle: Expanded(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: TakeCameraKtpWord.pastikanFoto.text,
                      style: textStyleW500(fontSize: 12)),
                  TextSpan(
                      text: TakeCameraKtpWord.sudahSesuai.text,
                      style: textStyleW600(fontSize: 12))
                ])),
              ),
              onAccept: () async {
                await camController?.dispose();
                Get.back();
                Get.back();
                Get.back();
                await Get.toNamed(ROUTE.registrationForm.name);
              },
              onReject: () async {
                Get.back();
                Get.back();
              });
        } else {
          return;
        }
      } catch (e) {
        DIALOG_HELPER("$e");
      }
    };
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

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    camController?.dispose();
    super.dispose();
  }

  @override
  void onReady() async {
    _mController.startProgressAnim();
    await _initCameraController(_cameras.first);
    super.onReady();
  }
}
