import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/opening_tnc_controller.dart';
import 'package:mobilenew/dummies_data/dummies.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class OpeningTnc extends StatelessWidget {
  OpeningTnc({super.key});
  final _controller = Get.put(OpeningTncController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      backgroundColor: Colors.white,
      appBar: APPBAR(onPressed: () => Get.back(), title: "Syarat & Ketentuan"),
      body: SingleChildScrollView(
        controller: _controller.scController,
        child: TncBody(),
      ),
      bottomNavigationBar: TncAgreementButton(),
    ));
  }
}

class TncAgreementButton extends StatelessWidget {
  TncAgreementButton({super.key});

  final OpeningTncController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: List.generate(2, (i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 12),
                child: MaterialButton(
                  onPressed: () => _controller.onChangeTncBtn(i),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(3),
                                color: _controller.btnColor[i]),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                size: 6,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: _controller.btnTitle[i],
                              style: textStyleW600(fontSize: 14)),
                          TextSpan(
                              text: _controller.btnTitleOrange[i],
                              style: textStyleW600(
                                  fontColor: ORANGE, fontSize: 14))
                        ])),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 48),
          Obx(() => BUTTON(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Lanjut",
                  style: textStyleW600(fontSize: 16, fontColor: Colors.white),
                ),
              ),
              onPressed: _controller.next(),
              radiusCircular: 999)),
          const SizedBox(height: 39),
        ],
      ),
    );
  }
}

class TncBody extends StatelessWidget {
  TncBody({super.key});

  final OpeningTncController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(
          _controller.dummiesTnc.length,
          (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Obx(() {
                return Column(
                  children: [
                    MaterialButton(
                      onPressed: _controller.openingTnc(i),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(TNC_TITLE,
                                  style: textStyleW600(fontSize: 14))),
                          const SizedBox(width: 19),
                          Transform.rotate(
                            angle: _controller.arrowAngle[i].value,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: ORANGE,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizeTransition(
                        axisAlignment: 1.0,
                        sizeFactor: _controller.animation[i].value,
                        child: Text(
                          TNC,
                          style: textStyleW500(fontSize: 14),
                        ))
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
