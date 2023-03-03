import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class OpeningAccount extends StatelessWidget {
  const OpeningAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      appBar: APPBAR(onPressed: () => Get.back(), title: "Buka Rekening"),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 52),
              Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: PINK_LIGHT),
                  child: Image.asset(
                      'assets/opening_account/opening_account.png')),
              const SizedBox(height: 24),
              Text("Ayo buka tabungan digital bisnis BNI Agen46 sekarang juga!",
                  style: textStyleW600(fontSize: 16),
                  textAlign: TextAlign.center),
              Text(
                  "Jika Anda sudah mempunyai rekening tabungan bisnis BNI Agen46 , silakan lakukan pendaftaran pada\nhalaman sebelumnya dan pilih “Sudah Punya",
                  style: textStyleW500(fontSize: 14),
                  textAlign: TextAlign.center),
              const SizedBox(height: 58),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  color: BLUE_LIGHT,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImageIcon(
                                AssetImage('assets/opening_account/lamp.png'),
                                color: BLUE_TEXT),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Untuk kelancaran pembukaan tabungan, siapkan\ndahulu:",
                                        style: textStyleW600(
                                            fontSize: 12,
                                            fontColor: BLUE_TEXT)),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "• e-KTP (wajib) & NPWP (bila ada)\n• Pulsa / paket data untuk pengiriman OTP\n• Kertas & alat tulis untuk foto tanda tangan",
                                          style: textStyleW600(
                                              fontSize: 12,
                                              fontColor: BLUE_TEXT)),
                                    ])),
                                  ]),
                            )
                          ])))
            ])),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
        child: BUTTON(
            radiusCircular: 999,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Lanjut",
                style: textStyleW600(fontSize: 16, fontColor: Colors.white),
              ),
            ),
            onPressed: () async => await Get.toNamed('openingTnc')),
      ),
    ));
  }
}
