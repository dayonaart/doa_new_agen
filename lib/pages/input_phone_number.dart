import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/input_phone_number_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';
import 'dart:math' as math;

import 'package:mobilenew/widget/widgets.dart';

class InputPhoneNumber extends StatelessWidget {
  InputPhoneNumber({super.key});
  final _controller = Get.put(InputPhoneNumberController());
  @override
  Widget build(BuildContext context) {
    return SAFE_AREA(
        child: SCAFFOLD(
            backgroundColor: Colors.white,
            appBar: APPBAR(
                onPressed: () => Get.back(),
                title: "Input Nomor Handphone",
                progressData: 1),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputLocation(),
                  Container(height: 8, color: GREY_BACKGROUND),
                  InputNumberPhone(),
                  const InputDescription(),
                ],
              ),
            ),
            bottomNavigationBar: InputNumberNextButton()));
  }
}

class InputNumberNextButton extends StatelessWidget {
  InputNumberNextButton({super.key});
  final InputPhoneNumberController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
      child: Obx(() => BUTTON(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text("Lanjut",
                style: textStyleW700(fontSize: 18, fontColor: Colors.white)),
          ),
          onPressed: _controller.next())),
    );
  }
}

class InputDescription extends StatelessWidget {
  const InputDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: BLUE_LIGHT,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/input_phone_number/lamp.png"),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              "Kami akan melakukan proses verifikasi nomor HP setelah proses pembukaan rekening selesai diproses. Pastikan ",
                          style: textStyleW500(
                              fontSize: 12, fontColor: BLUE_TEXT)),
                      TextSpan(
                          text:
                              "nomor Anda memiliki pulsa dan terkoneksi dengan jaringan Internet.",
                          style:
                              textStyleW700(fontSize: 12, fontColor: BLUE_TEXT))
                    ])),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/input_phone_number/key.png"),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Jaga kerahasiaan OTP ",
                          style: textStyleW700(
                              fontSize: 12, fontColor: BLUE_TEXT)),
                      TextSpan(
                          text:
                              "dengan tidak memberitahu kepada siapapun termasuk kepada Petugas Bank.",
                          style:
                              textStyleW500(fontSize: 12, fontColor: BLUE_TEXT))
                    ])),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputNumberPhone extends StatelessWidget {
  InputNumberPhone({super.key});
  final InputPhoneNumberController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nomor Handphone", style: textStyleW600(fontSize: 14)),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundImage:
                            AssetImage("assets/country_flag/indonesia.png"),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Indonesia (+62)",
                        style: textStyleW500(fontSize: 15),
                      ),
                      const SizedBox(width: 14.14),
                      Transform.rotate(
                          angle: 15 / math.pi,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: ORANGE,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                const SizedBox(width: 18.43),
                Expanded(
                    child: TextField(
                  controller: _controller.numberEditingController,
                  keyboardType: TextInputType.number,
                  onChanged: _controller.onInputNumberChanged(),
                  decoration:
                      const InputDecoration(enabledBorder: InputBorder.none),
                  style: textStyleW500(fontSize: 16),
                )),
                Obx(() {
                  if (_controller.helperValidation.value) {
                    return _controller.suffixHelperInputButton;
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputLocation extends StatelessWidget {
  InputLocation({super.key});
  final InputPhoneNumberController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Posisi Anda Saat Ini", style: textStyleW600(fontSize: 14)),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: _controller.selectingCountry(context),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.2, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Text(_controller.selectedCountry.value,
                      style: textStyleW500(fontSize: 16))),
                  Transform.rotate(
                      angle: 15 / math.pi,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ORANGE,
                        size: 20,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
