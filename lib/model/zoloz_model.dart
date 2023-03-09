import 'dart:convert';

class InitializeResModelResult {
  String? resultStatus;
  String? resultCode;
  String? resultMessage;

  InitializeResModelResult({
    this.resultStatus,
    this.resultCode,
    this.resultMessage,
  });
  InitializeResModelResult.fromJson(Map<String, dynamic> json) {
    resultStatus = json['resultStatus']?.toString();
    resultCode = json['resultCode']?.toString();
    resultMessage = json['resultMessage']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['resultStatus'] = resultStatus;
    data['resultCode'] = resultCode;
    data['resultMessage'] = resultMessage;
    return data;
  }
}

class InitializeResModel {
  InitializeResModelResult? result;
  ClientCfg? clientCfg;
  String? transactionId;

  InitializeResModel({
    this.result,
    this.clientCfg,
    this.transactionId,
  });
  InitializeResModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] != null)
        ? InitializeResModelResult.fromJson(json['result'])
        : null;
    clientCfg = ClientCfg.fromJson(jsonDecode(json['clientCfg']));
    transactionId = json['transactionId']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    if (clientCfg != null) {
      data['clientCfg'] = clientCfg?.toJson();
    }
    data['transactionId'] = transactionId;
    return data;
  }
}

class ClientCfgTasksInputParamsUseDefaultExit {
  bool? value;
  String? pipeType;

  ClientCfgTasksInputParamsUseDefaultExit({
    this.value,
    this.pipeType,
  });
  ClientCfgTasksInputParamsUseDefaultExit.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    pipeType = json['pipeType']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['pipeType'] = pipeType;
    return data;
  }
}

class ClientCfgTasksInputParamsValidateDelegate {
  bool? value;
  String? pipeType;

  ClientCfgTasksInputParamsValidateDelegate({
    this.value,
    this.pipeType,
  });
  ClientCfgTasksInputParamsValidateDelegate.fromJson(
      Map<String, dynamic> json) {
    value = json['value'];
    pipeType = json['pipeType']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['pipeType'] = pipeType;
    return data;
  }
}

class ClientCfgTasksInputParamsZimInitResp {
  String? value;
  String? pipeType;

  ClientCfgTasksInputParamsZimInitResp({
    this.value,
    this.pipeType,
  });
  ClientCfgTasksInputParamsZimInitResp.fromJson(Map<String, dynamic> json) {
    value = json['value']?.toString();
    pipeType = json['pipeType']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['pipeType'] = pipeType;
    return data;
  }
}

class ClientCfgTasksInputParamsZimId {
/*
{
  "value": "faceZimId",
  "pipeType": "context"
} 
*/

  String? value;
  String? pipeType;

  ClientCfgTasksInputParamsZimId({
    this.value,
    this.pipeType,
  });
  ClientCfgTasksInputParamsZimId.fromJson(Map<String, dynamic> json) {
    value = json['value']?.toString();
    pipeType = json['pipeType']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['pipeType'] = pipeType;
    return data;
  }
}

class ClientCfgTasksInputParams {
  ClientCfgTasksInputParamsZimId? zimId;
  ClientCfgTasksInputParamsZimInitResp? zimInitResp;
  ClientCfgTasksInputParamsValidateDelegate? validateDelegate;
  ClientCfgTasksInputParamsUseDefaultExit? useDefaultExit;

  ClientCfgTasksInputParams({
    this.zimId,
    this.zimInitResp,
    this.validateDelegate,
    this.useDefaultExit,
  });
  ClientCfgTasksInputParams.fromJson(Map<String, dynamic> json) {
    zimId = (json['zimId'] != null)
        ? ClientCfgTasksInputParamsZimId.fromJson(json['zimId'])
        : null;
    zimInitResp = (json['zimInitResp'] != null)
        ? ClientCfgTasksInputParamsZimInitResp.fromJson(json['zimInitResp'])
        : null;
    validateDelegate = (json['validateDelegate'] != null)
        ? ClientCfgTasksInputParamsValidateDelegate.fromJson(
            json['validateDelegate'])
        : null;
    useDefaultExit = (json['useDefaultExit'] != null)
        ? ClientCfgTasksInputParamsUseDefaultExit.fromJson(
            json['useDefaultExit'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (zimId != null) {
      data['zimId'] = zimId!.toJson();
    }
    if (zimInitResp != null) {
      data['zimInitResp'] = zimInitResp!.toJson();
    }
    if (validateDelegate != null) {
      data['validateDelegate'] = validateDelegate!.toJson();
    }
    if (useDefaultExit != null) {
      data['useDefaultExit'] = useDefaultExit!.toJson();
    }
    return data;
  }
}

class ClientCfgTasks {
  ClientCfgTasksInputParams? inputParams;
  String? name;
  int? index;
  String? type;

  ClientCfgTasks({
    this.inputParams,
    this.name,
    this.index,
    this.type,
  });
  ClientCfgTasks.fromJson(Map<String, dynamic> json) {
    inputParams = (json['inputParams'] != null)
        ? ClientCfgTasksInputParams.fromJson(json['inputParams'])
        : null;
    name = json['name']?.toString();
    index = json['index']?.toInt();
    type = json['type']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (inputParams != null) {
      data['inputParams'] = inputParams!.toJson();
    }
    data['name'] = name;
    data['index'] = index;
    data['type'] = type;
    return data;
  }
}

class ClientCfgFactorContextKeyMeta {
  String? resourceCode;
  String? mid;
  String? keyVer;

  ClientCfgFactorContextKeyMeta({
    this.resourceCode,
    this.mid,
    this.keyVer,
  });
  ClientCfgFactorContextKeyMeta.fromJson(Map<String, dynamic> json) {
    resourceCode = json['resourceCode']?.toString();
    mid = json['mid']?.toString();
    keyVer = json['keyVer']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['resourceCode'] = resourceCode;
    data['mid'] = mid;
    data['keyVer'] = keyVer;
    return data;
  }
}

class ClientCfgFactorContext {
  String? GATEWAYURL;
  String? WORKSPACEID;
  String? APPID;
  String? faceZimId;
  int? merchantId;
  ClientCfgFactorContextKeyMeta? keyMeta;
  String? zimInitResp;
  String? authType;
  int? ENV;
  String? REMOTELOGURL;

  ClientCfgFactorContext({
    this.GATEWAYURL,
    this.WORKSPACEID,
    this.APPID,
    this.faceZimId,
    this.merchantId,
    this.keyMeta,
    this.zimInitResp,
    this.authType,
    this.ENV,
    this.REMOTELOGURL,
  });
  ClientCfgFactorContext.fromJson(Map<String, dynamic> json) {
    GATEWAYURL = json['GATEWAY_URL']?.toString();
    WORKSPACEID = json['WORKSPACE_ID']?.toString();
    APPID = json['APP_ID']?.toString();
    faceZimId = json['faceZimId']?.toString();
    merchantId = int.tryParse(json['merchantId']);
    keyMeta = (json['keyMeta'] != null)
        ? ClientCfgFactorContextKeyMeta.fromJson(jsonDecode(json['keyMeta']))
        : null;
    zimInitResp = json['zimInitResp']?.toString();
    authType = json['authType']?.toString();
    ENV = int.tryParse(json['ENV']);
    REMOTELOGURL = json['REMOTELOG_URL']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['GATEWAY_URL'] = GATEWAYURL;
    data['WORKSPACE_ID'] = WORKSPACEID;
    data['APP_ID'] = APPID;
    data['faceZimId'] = faceZimId;
    data['merchantId'] = merchantId;
    if (keyMeta != null) {
      data['keyMeta'] = keyMeta!.toJson();
    }
    data['zimInitResp'] = zimInitResp;
    data['authType'] = authType;
    data['ENV'] = ENV;
    data['REMOTELOG_URL'] = REMOTELOGURL;
    return data;
  }
}

class ClientCfg {
  int? clientStartIndex;
  String? flowId;
  ClientCfgFactorContext? factorContext;
  List<ClientCfgTasks?>? tasks;

  ClientCfg({
    this.clientStartIndex,
    this.flowId,
    this.factorContext,
    this.tasks,
  });
  ClientCfg.fromJson(Map<String, dynamic> json) {
    clientStartIndex = json['clientStartIndex']?.toInt();
    flowId = json['flowId']?.toString();
    factorContext = (json['factorContext'] != null)
        ? ClientCfgFactorContext.fromJson(json['factorContext'])
        : null;
    if (json['tasks'] != null) {
      final v = json['tasks'];
      final arr0 = <ClientCfgTasks>[];
      v.forEach((v) {
        arr0.add(ClientCfgTasks.fromJson(v));
      });
      tasks = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clientStartIndex'] = clientStartIndex;
    data['flowId'] = flowId;
    if (factorContext != null) {
      data['factorContext'] = factorContext!.toJson();
    }
    if (tasks != null) {
      final v = tasks;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['tasks'] = arr0;
    }
    return data;
  }
}

class ResponseDataExtInfo {
/*
{
  "info": ""
} 
*/

  dynamic info;

  ResponseDataExtInfo({
    this.info,
  });
  ResponseDataExtInfo.fromJson(Map<String, dynamic> json) {
    info = json['info'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['info'] = info;
    return data;
  }
}

class ResponseData {
  String? retCode;
  ResponseDataExtInfo? extInfo;

  ResponseData({
    this.retCode,
    this.extInfo,
  });
  ResponseData.fromJson(Map<String, dynamic> json) {
    retCode = json['retCode']?.toString();
    extInfo = (json['extInfo'] != null)
        ? ResponseDataExtInfo.fromJson(json['extInfo'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['retCode'] = retCode;
    if (extInfo != null) {
      data['extInfo'] = extInfo!.toJson();
    }
    return data;
  }
}

class InitializePayload {
  String? metaInfo;
  String? serviceLevel;
  String? docType;
  String? bizId;
  String? userId;

  InitializePayload({
    this.metaInfo,
    this.serviceLevel,
    this.docType,
    this.bizId,
    this.userId,
  });
  InitializePayload.fromJson(Map<String, dynamic> json) {
    metaInfo = json['metaInfo']?.toString();
    serviceLevel = json['serviceLevel']?.toString();
    docType = json['docType']?.toString();
    bizId = json['bizId']?.toString();
    userId = json['userId']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['metaInfo'] = metaInfo;
    data['serviceLevel'] = serviceLevel;
    data['docType'] = docType;
    data['bizId'] = bizId;
    data['userId'] = userId;
    return data;
  }
}

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CheckResultResModelExtInfoRect {
/*
{
  "top": 250,
  "left": 136,
  "bottom": 511,
  "right": 397
} 
*/

  int? top;
  int? left;
  int? bottom;
  int? right;

  CheckResultResModelExtInfoRect({
    this.top,
    this.left,
    this.bottom,
    this.right,
  });
  CheckResultResModelExtInfoRect.fromJson(Map<String, dynamic> json) {
    top = json['top']?.toInt();
    left = json['left']?.toInt();
    bottom = json['bottom']?.toInt();
    right = json['right']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['top'] = top;
    data['left'] = left;
    data['bottom'] = bottom;
    data['right'] = right;
    return data;
  }
}

class CheckResultResModelExtInfo {
  CheckResultResModelExtInfoRect? rect;
  int? retryCount;
  bool? faceAttack;
  String? quality;
  String? imageContent;

  CheckResultResModelExtInfo({
    this.rect,
    this.retryCount,
    this.faceAttack,
    this.quality,
    this.imageContent,
  });
  CheckResultResModelExtInfo.fromJson(Map<String, dynamic> json) {
    rect = (json['rect'] != null)
        ? CheckResultResModelExtInfoRect.fromJson(json['rect'])
        : null;
    retryCount = json['retryCount']?.toInt();
    faceAttack = json['faceAttack'];
    quality = json['quality']?.toString();
    imageContent = json['imageContent']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (rect != null) {
      data['rect'] = rect!.toJson();
    }
    data['retryCount'] = retryCount;
    data['faceAttack'] = faceAttack;
    data['quality'] = quality;
    data['imageContent'] = imageContent;

    return data;
  }
}

class CheckResultResModelResult {
/*
{
  "resultStatus": "S",
  "resultCode": "SUCCESS",
  "resultMessage": "Success"
} 
*/

  String? resultStatus;
  String? resultCode;
  String? resultMessage;

  CheckResultResModelResult({
    this.resultStatus,
    this.resultCode,
    this.resultMessage,
  });
  CheckResultResModelResult.fromJson(Map<String, dynamic> json) {
    resultStatus = json['resultStatus']?.toString();
    resultCode = json['resultCode']?.toString();
    resultMessage = json['resultMessage']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['resultStatus'] = resultStatus;
    data['resultCode'] = resultCode;
    data['resultMessage'] = resultMessage;
    return data;
  }
}

class CheckResultResModel {
  CheckResultResModelResult? result;
  CheckResultResModelExtInfo? extInfo;

  CheckResultResModel({
    this.result,
    this.extInfo,
  });
  CheckResultResModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] != null)
        ? CheckResultResModelResult.fromJson(json['result'])
        : null;
    extInfo = (json['extInfo'] != null)
        ? CheckResultResModelExtInfo.fromJson(json['extInfo'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    if (extInfo != null) {
      data['extInfo'] = extInfo!.toJson();
    }
    return data;
  }
}

class GetAllDataResModel {
  int? id;
  String? transactionId;
  String? bizId;
  String? deviceModel;
  String? img;

  GetAllDataResModel({
    this.id,
    this.transactionId,
    this.bizId,
    this.deviceModel,
    this.img,
  });
  GetAllDataResModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    transactionId = json['transactionId']?.toString();
    bizId = json['bizId']?.toString();
    deviceModel = json['deviceModel']?.toString();
    img = json['img']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transactionId'] = transactionId;
    data['bizId'] = bizId;
    data['deviceModel'] = deviceModel;
    data['img'] = img;
    return data;
  }
}
