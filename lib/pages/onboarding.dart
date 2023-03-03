import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/const_path.dart';
import 'package:mobilenew/controller/onboarding_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final _controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
      child: SCAFFOLD(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                    items: List.generate(4, (i) {
                      return Image.asset(
                        onboarding1,
                        filterQuality: FilterQuality.high,
                      );
                    }),
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 271,
                        viewportFraction: 1,
                        onPageChanged: _controller.onPageChanged())),
                OnBoardingBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key});
  final OnBoardingController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(4, (i) {
                return Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _controller.carouselIndexColor(i))),
                  );
                });
              })),
          const SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tunggu Apalagi!",
                style: textStyleW600(fontSize: 18, fontColor: BLUE_TEXT),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Nikmati kemudahan dengan BNI Agen46",
                    style: textStyleW500(fontSize: 12, fontColor: BLUE_TEXT)),
                TextSpan(
                    text: "#Melayani Paling Dekat",
                    style: textStyleW700(fontColor: BLUE_TEXT, fontSize: 16))
              ]))
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              OUTLINE_BUTTON(
                  onPressed: _controller.next(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Belum punya akun BNI Agen46 ?",
                            style: textStyleW500(
                                fontColor: BLUE_TEXT, fontSize: 10)),
                        TextSpan(
                            text: "\nDaftar Sekarang",
                            style: textStyleW500(
                                fontSize: 17, fontColor: BLUE_TEXT))
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  )),
              const SizedBox(height: 16),
              BUTTON(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Masuk",
                      style:
                          textStyleW700(fontSize: 18, fontColor: Colors.white),
                    ),
                  ),
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
