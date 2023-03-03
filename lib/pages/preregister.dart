import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class PreRegister extends StatelessWidget {
  const PreRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
      top: true,
      bottom: true,
      child: SCAFFOLD(
        backgroundColor: Colors.white,
        appBar: APPBAR(
            icon: Icons.arrow_back,
            centerTitle: false,
            onPressed: () => Get.back(),
            title: "Pendaftaran BNI Agen46"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/preregister/preregister.png'),
              const SizedBox(height: 20),
              Text(
                "Apakah Anda sudah memiliki Rekening Taplus Bisnis BNI Agen46 ?",
                style: textStyleW500(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Row(
            children: [
              Expanded(
                  child: OUTLINE_BUTTON(
                      onPressed: () async =>
                          await Get.toNamed('openingAccount'),
                      sideColor: ORANGE,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Belum punya",
                          style: textStyleW600(fontSize: 14, fontColor: ORANGE),
                        ),
                      ))),
              const SizedBox(width: 12),
              Expanded(
                  child: BUTTON(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Sudah punya",
                          style: textStyleW600(
                              fontSize: 14, fontColor: Colors.white),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
