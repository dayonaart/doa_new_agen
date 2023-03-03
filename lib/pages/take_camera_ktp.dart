import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/take_camera_ktp_controller.dart';
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
                title: "Registrasi",
                progressData: 3),
            body: CameraTakePreview()));
  }
}

class CameraTakePreview extends StatelessWidget {
  final TakeCameraKtpController _controller = Get.find();

  CameraTakePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isCameraReady.value) {
        // return Container();
        return SizedBox(
            height: Get.height,
            width: Get.width,
            child: CameraPreview(
              _controller.camController!,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CameraTool(),
              ),
            ));
      } else {
        return Container();
      }
    });
  }
}

class CameraTool extends StatelessWidget {
  final TakeCameraKtpController _controller = Get.find();

  CameraTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 24),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                  child: Text.rich(TextSpan(
                      children: _controller.cameraHelperDescriptionWidget)),
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
                    onTap: _controller.takePicture(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/take_camera_ktp/take_button.png',
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
                  onTap: _controller.changeCameraDirection(),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/take_camera_ktp/flip_button.png',
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
    );
  }
}

class PreviewKtp extends StatelessWidget {
  final String? imagePath;
  const PreviewKtp({super.key, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Registrasi",
                progressData: 3),
            body: Center(
              child: Image.file(File(imagePath!)),
            )));
  }
}
