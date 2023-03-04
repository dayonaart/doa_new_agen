import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/controller/take_camera_ktp_controller.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/widget/dashed_rect.dart';
import 'package:mobilenew/widget/widgets.dart';

class TakeCameraKtp extends StatelessWidget {
  TakeCameraKtp({super.key});
  final _controller = Get.put(TakeCameraKtpController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: TakeCameraKtpWord.registrasi.text,
                progressData: 3),
            body: GetBuilder<TakeCameraKtpController>(builder: (_) {
              return TakeCameraPreview();
            })));
  }
}

class TakeCameraPreview extends StatelessWidget {
  final TakeCameraKtpController _ = Get.find();

  TakeCameraPreview({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_.isCameraReady) {
        return SizedBox(
            height: Get.height,
            width: Get.width,
            child: CameraPreview(
              _.camController!,
              child: TakeCameraTool(),
            ));
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
                  const Icon(Icons.help_outline_rounded, color: BLUE_TEXT),
                  const SizedBox(width: 9.67),
                  Expanded(
                    child: Text.rich(
                        TextSpan(children: _.cameraHelperDescriptionWidget)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 96),
          SizedBox(
            height: Get.height / 4,
            width: Get.width,
            child: const DashedRect(color: Colors.white),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43.33),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 72,
                    width: 72,
                    child: GestureDetector(
                      onTap: _.takePicture(),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          takeCameraButtonAssets,
                          color: Colors.white,
                        ),
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
                        color: Colors.white,
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
