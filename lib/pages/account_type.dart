import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/account_type_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'package:mobilenew/widget/widgets.dart';
import 'dart:math' as math;

class AccountType extends StatelessWidget {
  AccountType({super.key});
  final _controller = Get.put(AccountTypeController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
      appBar: APPBAR(
          onPressed: () => Get.back(),
          title: "Pilih Rekening",
          progressData: 2),
      body: SingleChildScrollView(
        controller: _controller.scController,
        child: Column(
          children: [
            const AccountHeader(),
            AccountList(),
            const SizedBox(height: 14.76),
            AccountTitle(),
            const SizedBox(height: 24),
            AccountFeature(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
        child: BUTTON(
            radiusCircular: 999,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Pilih",
                style: textStyleW600(fontSize: 16, fontColor: Colors.white),
              ),
            ),
            onPressed: _controller.next()),
      ),
    ));
  }
}

class AccountFeature extends StatelessWidget {
  AccountFeature({super.key});
  final AccountTypeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fitur Kartu",
              style: textStyleW600(fontSize: 14, fontColor: ORANGE)),
          const SizedBox(height: 20),
          Obx(() {
            return Column(
              children: List.generate(_controller.featureLength, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        FeatureTitleList.values[i].title,
                        style: textStyleW500(fontSize: 14),
                      )),
                      Expanded(
                          child: Text(
                        _controller.featureValue[i],
                        style: textStyleW600(fontSize: 14),
                        textAlign: TextAlign.end,
                      ))
                    ],
                  ),
                );
              }),
            );
          }),
          Obx(() {
            return SizeTransition(
                axisAlignment: 1.0,
                sizeFactor: _controller.animation.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Keuntungan & Manfaat",
                        style: textStyleW600(fontSize: 14, fontColor: ORANGE)),
                    const SizedBox(height: 20),
                    Column(
                      children: List.generate(4, (i) {
                        return Text(
                          _controller.expandDesc.value,
                          style: textStyleW500(fontSize: 14),
                        );
                      }),
                    ),
                  ],
                ));
          }),
          MaterialButton(
              padding: const EdgeInsets.all(0),
              onPressed: _controller.showFullFeature(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(
                      _controller.showFullFeatureBtnTitle.value,
                      style: textStyleW600(fontSize: 14, fontColor: ORANGE),
                    );
                  }),
                  const SizedBox(width: 14.41),
                  Obx(() {
                    return Transform.rotate(
                        angle: _controller.showFullFeatureArrowAngle.value /
                            math.pi,
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: ORANGE,
                          size: 20,
                        ));
                  })
                ],
              ))
        ],
      ),
    );
  }
}

class AccountTitle extends StatelessWidget {
  AccountTitle({super.key});

  final AccountTypeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Obx(() {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _controller.carouselIndexColor(i)),
                  height: 8,
                  width: 8,
                );
              }),
            );
          }),
        ),
        const SizedBox(height: 16),
        Obx(() => Text(
              _controller.accountCardName.value,
              style: textStyleW600(fontSize: 16),
            ))
      ],
    );
  }
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jenis Tabungan",
            style: textStyleW600(fontSize: 14),
          ),
          const SizedBox(height: 27.75),
          BUTTON(
              radiusCircular: 999,
              isExpanded: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  "Taplus Bisnis Agen46",
                  style: textStyleW600(fontSize: 14),
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 24.25),
          Text(
              "Memberikan kemudahan, kenyamanan layanan dan banyak keuntungan untuk berbagai aktifitas perbankan.",
              style: textStyleW500(fontSize: 14)),
          const SizedBox(height: 23.69),
        ],
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  AccountList({super.key});

  final AccountTypeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(3, (i) {
          return Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Opacity(
                opacity: _controller.corouselIndex.value == i ? 1 : 0.4,
                child: Image.asset(
                  "assets/account_type/account${i + 1}.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
            );
          });
        }),
        options: CarouselOptions(
            height: 137,
            // padEnds: true,
            viewportFraction: 0.55,
            enableInfiniteScroll: true,
            onPageChanged: _controller.onPageChanged()));
  }
}
