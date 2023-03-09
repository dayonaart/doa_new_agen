import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobilenew/api/api.dart';
import 'package:mobilenew/controller/main_controller.dart';
import 'package:mobilenew/model/zoloz_model.dart';
import 'package:mobilenew/widget/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zolozkit_for_flutter/zolozkit_for_flutter.dart';

class FaceAndSelfieVericationController extends GetxController {
  final MainController _mController = Get.find();

  Future<String> copyUIConfigFile() async {
    var file = await rootBundle.load("assets/UIConfig.zip");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String configFilePath = "${appDocDir.path}/UIConfig.zip";
    final buffer = file.buffer;
    await File(configFilePath).writeAsBytes(
        buffer.asUint8List(file.offsetInBytes, file.lengthInBytes));
    return configFilePath;
  }

  Future<InitializePayload> _initializePayload() async {
    var metaInfo = await ZolozkitForFlutter.metaInfo;
    var _initPayload = InitializePayload(
        metaInfo: metaInfo,
        serviceLevel: "REALID0002",
        docType: "00000001003",
        bizId: "${DateTime.now().millisecondsSinceEpoch}",
        userId: "${DateTime.now().millisecondsSinceEpoch}");
    return _initPayload;
  }

  void Function()? startZoloz() {
    return () async {
      String? configPath = await ZolozkitForFlutter.zolozChameleonConfigPath;
      String? local = await ZolozkitForFlutter.zolozLocale;
      var _initPayload = await _initializePayload();
      var _res =
          await Api().POST("realid/initialize", payload: _initPayload.toJson());
      if (_res == null) return;
      var _initResponse = InitializeResModel.fromJson(_res);
      try {
        await ZolozkitForFlutter.start(
          jsonEncode(_initResponse.clientCfg?.toJson()),
          {configPath: (await copyUIConfigFile()), local: "en-US"},
          //onInterrupt
          (retCode, extInfo) async {
            await _checkResult(_initPayload.bizId!,
                _initResponse.transactionId!, _initPayload.metaInfo!);
          },
          //onComplete
          (retCode, extInfo) async {
            await _checkResult(_initPayload.bizId!,
                _initResponse.transactionId!, _initPayload.metaInfo!);
          },
        );
      } catch (e) {
        DIALOG_HELPER("ERROR $e");
      }
    };
  }

  Future<void> _checkResult(
      String bizId, String transactionId, String metainfo) async {
    var _res = await Api().POST("facecapture/checkresult",
        payload: jsonEncode({
          "bizId": bizId,
          "transactionId": transactionId,
          "metaInfo": metainfo
        }));
    if (_res != null) {
      DIALOG_HELPER("$_res");
      // setState(() {
      //   _checkResultResModel = CheckResultResModel.fromJson(_res);
      // });
    }
  }

  @override
  void onReady() {
    _mController.startProgressAnim();
    super.onReady();
  }
}
