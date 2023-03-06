import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/controller/take_camera_ktp_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/widget/widgets.dart';

class TakeCameraKtp extends StatelessWidget {
  TakeCameraKtp({super.key});
  final _controller = Get.put(TakeCameraKtpController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: _controller.onBack(),
                title: TakeCameraKtpWord.registrasi.text,
                progressData: 3),
            body: GetBuilder<TakeCameraKtpController>(builder: (_) {
              return TakeCameraPreview();
            })));
  }
}

class TakeCameraPreview extends StatelessWidget {
  final TakeCameraKtpController _controller = Get.find();

  TakeCameraPreview({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_controller.isCameraReady) {
        return TakeCameraTool();
      } else {
        return Container();
      }
    });
  }
}

class TakeCameraTool extends StatelessWidget {
  final TakeCameraKtpController _ = Get.find();

  TakeCameraTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 24),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: BLUE_LIGHT,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(AssetImage(iAssets), color: BLUE_TEXT),
                  const SizedBox(width: 9.67),
                  Expanded(
                      child: Text.rich(
                          TextSpan(children: _.cameraHelperDescriptionWidget))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 96),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _.cameraPreviewWidget(boxHeight: 248, boxWidth: 365),
              const SizedBox(height: 50),
              Text("Scanning ${_.progressTextRecognize}%")
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                SizedBox(
                  height: 72,
                  width: 72,
                  child: GestureDetector(
                    // onTap: _.takePicture(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        takeCameraButtonAssets,
                        color: ORANGE,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 33.33,
                  width: 33.33,
                  child: GestureDetector(
                    onTap: _.changeCameraDirection(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        flipCameraButtonAssets,
                        color: ORANGE,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 63),
        ],
      ),
    );
  }
}

class PreviewKtp extends StatelessWidget {
  final MainController _mainController = Get.find();
  PreviewKtp({super.key});
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: TakeCameraKtpWord.registrasi.text,
                progressData: 3),
            body: Center(
              child: Obx(() {
                if (_mainController.ktpFilePath.isEmpty) return Container();
                return Image.file(File(_mainController.ktpFilePath.value));
              }),
            )));
  }
}
