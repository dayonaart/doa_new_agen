import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/style/colors.dart';
import 'package:mobilenew/style/textstyle.dart';

SafeArea SAFE_AREA({
  @required Widget? child,
  bool top = false,
  bool bottom = false,
}) {
  assert(child != null);
  return SafeArea(
    top: top,
    bottom: bottom,
    child: child!,
  );
}

Scaffold SCAFFOLD({
  @required Widget? body,
  Widget? bottomNavigationBar,
  PreferredSizeWidget? appBar,
  Color? backgroundColor,
}) {
  assert(body != null);
  return Scaffold(
    backgroundColor: backgroundColor ?? Colors.white,
    appBar: appBar,
    body: body,
    bottomNavigationBar: bottomNavigationBar,
    // floatingActionButton: bottomNavigationBar,
    // bottomSheet: bottomNavigationBar,
  );
}

AppBar APPBAR(
    {required void Function()? onPressed,
    @required String? title,
    IconData? icon,
    int? progressData,
    bool centerTitle = true}) {
  // print(Get.currentRoute);
  assert(title != null);
  return AppBar(
    bottom: progressData != null ? PROGRESS_BAR_DATA(progressData) : null,
    centerTitle: centerTitle,
    elevation: Get.currentRoute == "preRegister" ? 0 : 0.5,
    shadowColor:
        Get.currentRoute == "preRegister" ? Colors.white : GREY_BACKGROUND,
    title: Text(
      title!,
      style: textStyleW500(fontSize: 16, fontColor: Colors.black),
    ),
    leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon ?? Icons.arrow_back_ios,
          color: Colors.black,
        )),
    backgroundColor: Colors.white,
  );
}

ElevatedButton OUTLINE_BUTTON({
  @required Widget? child,
  @required void Function()? onPressed,
  Color sideColor = BLUE_DARK,
  double? radiusCircular,
}) {
  assert(child != null);
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiusCircular ?? 6),
                  side: BorderSide(width: 0.5, color: sideColor))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child!,
        ],
      ));
}

ElevatedButton BUTTON({
  @required Widget? child,
  @required void Function()? onPressed,
  double? radiusCircular,
  bool isExpanded = true,
}) {
  assert(child != null);
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiusCircular ?? 6))),
          backgroundColor: MaterialStateProperty.all<Color>(
              onPressed == null ? GREY : ORANGE)),
      child: Row(
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child!,
        ],
      ));
}

final MainController _mainController = Get.find();
PreferredSize PROGRESS_BAR_DATA(int progressData) {
  return PreferredSize(
      preferredSize: Size(Get.width, 0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              Container(width: Get.width, color: GREY_BACKGROUND, height: 5),
              SizedBox(
                  width: Get.width / 10 * progressData,
                  height: 5,
                  child: Obx(() => LinearProgressIndicator(
                        color: ORANGE,
                        value: _mainController.progress.value,
                        backgroundColor: GREY_BACKGROUND,
                      ))),
            ],
          )));
}

Future DIALOG_HELPER(String text) {
  return Get.dialog(Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Container(
            width: Get.width / 1.2,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.help, color: ORANGE),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(text, style: textStyleW600(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
