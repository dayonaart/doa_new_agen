import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/pages/take_camera_ktp.dart';
import 'package:mobilenew/routes.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/dashed_rect.dart';
import 'package:mobilenew/widget/text_recognize_painter.dart';
import 'package:mobilenew/widget/widgets.dart';

class TakeCameraKtpController extends GetxController
    with WidgetsBindingObserver {
  late List<CameraDescription> _cameras;
  late CameraController? camController;
  bool isCameraReady = false;
  final MainController _mController = Get.find();
  String scannedText = "";
  final _cameraPrev = GlobalKey();
  final TextRecognizer _textRecognizer = TextRecognizer();
  CustomPaint? customPaint;
  double maxWidth = 0;
  double maxHeight = 0;
  final bool _canProcess = true;
  bool _isBusy = false;
  bool converting = false;
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
      if (isCameraReady) {
        camController?.startImageStream(_processCameraImage);
      }
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
                await camController?.startImageStream(_processCameraImage);
              });
        } else {
          return;
        }
      } catch (e) {
        DIALOG_HELPER("$e");
      }
    };
  }

  Future _processCameraImage(CameraImage image) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = _cameras[0];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    final _recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null &&
        _cameraPrev.currentContext != null) {
      final RenderBox renderBox =
          _cameraPrev.currentContext?.findRenderObject() as RenderBox;

      var painter = TextRecognizerPainter(
        _recognizedText,
        inputImage.inputImageData!.size,
        inputImage.inputImageData!.imageRotation,
        renderBox,
        (val) async {
          scannedText = val;
          if (checkKtpData()) {
            await camController?.stopImageStream();
            await Future.delayed(const Duration(seconds: 3));
            takePicture().call();
          }
        },
        getRawData: (val) async {},
        boxBottomOff: 9,
        boxTopOff: 9,
        boxRightOff: 9,
        boxLeftOff: 9,
      );

      customPaint = CustomPaint(painter: painter);
      await Future.delayed(const Duration(milliseconds: 900)).then((value) {
        if (!converting) {
          _isBusy = false;
        }
        update();
      });
    }
  }

  Widget cameraPreviewWidget({
    double? boxHeight,
    double? boxWidth,
  }) {
    const double previewAspectRatio = 0.5;
    return SizedBox(
      height: boxHeight ?? Get.height,
      // width: boxWidth ?? Get.width,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: boxHeight ?? Get.height / 5,
              key: _cameraPrev,
              child: AspectRatio(
                aspectRatio: 1 / previewAspectRatio,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Transform.scale(
                    scale:
                        camController!.value.aspectRatio / previewAspectRatio,
                    child: Center(
                      child: CameraPreview(
                        camController!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (customPaint != null)
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              maxWidth = constraints.maxWidth;
              maxHeight = constraints.maxHeight;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (TapDownDetails details) =>
                    onViewFinderTap(details, constraints),
                child: customPaint!,
              );
            }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: boxHeight ?? Get.height / 5,
              child: const DashedRect(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (camController == null) {
      return;
    }

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    camController?.setExposurePoint(offset);
    camController?.setFocusPoint(offset);
  }

  void Function() onBack() {
    return () {
      // await camController?.dispose();
      // await camController?.stopImageStream();
      Get.back();
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
    camController?.dispose();
    camController?.stopImageStream();
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
  void onReady() async {
    _mController.startProgressAnim();
    await _initCameraController(_cameras.first);
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

  List<bool> validation = List.generate(3, (i) => false);
  List<String> ktpData = List.generate(3, (i) => "");
  String dob = "";
  double get progressTextRecognize {
    var _check = validation.where((e) => e).length;
    switch (_check) {
      case 1:
        return 35;
      case 2:
        return 75;
      case 3:
        return 100;
      default:
        return 0;
    }
  }

  String? _parseDate(String date) {
    try {
      var _formatted = DateFormat.yMd().parse(date);
      return DateFormat("dd MMMM yyyy").format(_formatted);
    } catch (e) {
      return null;
    }
  }

  String? _fullName(String? firstName, String? lastName) {
    try {
      return "${firstName!} ${lastName!}";
    } catch (e) {
      return null;
    }
  }

  bool checkKtpData() {
    var _sc = scannedText.replaceAll(":", "").split(" ");
    var _findNik = _sc.indexOf("NIK");
    bool _nikValidation = _sc[(_findNik - 1)].length == 16;
    var _name =
        _fullName(_sc[(_sc.indexOf("NIK")) + 1], _sc[(_sc.indexOf("NIK")) + 2]);
    var _dobValidation = _parseDate(_sc
        .where((element) => element.contains("-"))
        .first
        .replaceAll("-", "/")
        .trim());
    if (_nikValidation) {
      var _findNikIndex = (_sc.indexOf("NIK") - 1);
      ktpData[0] = _sc[_findNikIndex];
      validation[0] = true;
    }
    if (_name != null) {
      ktpData[1] = _name;
      validation[1] = true;
    }
    if (_dobValidation != null) {
      ktpData[2] = _dobValidation;
      validation[2] = true;
    }
    return validation.every((element) => element);
  }
}
