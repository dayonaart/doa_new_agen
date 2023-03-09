import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/face_and_selfie_verification_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class FaceAndAndSelfieVerication extends StatelessWidget {
  FaceAndAndSelfieVerication({super.key});
  final _controller = Get.put(FaceAndSelfieVericationController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Verifikasi Wajah & Selfie",
                progressData: 7),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.25),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                        height: 152,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(takeFaceAndSelfie)))),
                    const SizedBox(height: 24),
                    Text("Verifikasi Wajah dan Selfie dengan KTP",
                        style: textStyleW600(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                        "Proses ini bertujuan untuk mempermudah melakukan validasi data Anda.",
                        style: textStyleW500(fontSize: 14),
                        textAlign: TextAlign.center),
                    Card(
                      color: BLUE_LIGHT,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.25, vertical: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageIcon(AssetImage(lampAssets), color: BLUE_TEXT),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            "Pastikan wajah dan e-KTP terlihat jelas dengan melakukan hal sebagai berikut:\n",
                                        style: textStyleW600()),
                                    const TextSpan(
                                        text: "• Berada pada ruangan dengan"),
                                    TextSpan(
                                        text: " pencahayaan cukup\n",
                                        style: textStyleW600()),
                                    const TextSpan(
                                        text:
                                            "• Lepaskan aksesoris yang menutupi wajah "),
                                    TextSpan(
                                        text:
                                            "(kacamata, masker, topi, dll.)\n",
                                        style: textStyleW600()),
                                    const TextSpan(
                                        text:
                                            "• Pastikan foto yang anda ambil"),
                                    TextSpan(
                                        text: " sudah fokus (tidak blur)",
                                        style: textStyleW600()),
                                  ],
                                  style: textStyleW500(
                                      fontSize: 12, fontColor: BLUE_TEXT)),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
