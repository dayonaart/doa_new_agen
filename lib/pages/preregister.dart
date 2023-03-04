import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/enum.dart';
import 'package:mobilenew/routes.dart';
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
            title: PreregisterWord.pendaftaranBNIAgen46.text),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(preregisterAssets),
              const SizedBox(height: 20),
              Text(
                PreregisterWord.apakahAndaSudahMemilikiRekening.text,
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
                          await Get.toNamed(ROUTE.openingAccount.name),
                      sideColor: ORANGE,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          PreregisterWord.belumPunya.text,
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
                          PreregisterWord.sudahPunya.text,
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
