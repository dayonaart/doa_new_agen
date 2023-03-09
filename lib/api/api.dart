// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:mobilenew/widget/widgets.dart';

class Api {
  final BaseOptions _baseOptions = BaseOptions(
      baseUrl: "https://dev.farizdotid.com/api/daerahindonesia/",
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json");
  final BaseOptions _zolozBaseOptions = BaseOptions(
      // baseUrl: "https://zolozagen.herokuapp.com/api/",
      // change baseUrl your ip
      baseUrl: "http://192.168.158.204:8080/api/",
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json");
  Future<dynamic> GET(String endpoint) async {
    try {
      var _res = await Dio(_baseOptions).get(endpoint);
      return _res.data;
    } on DioError catch (e) {
      DIALOG_HELPER(" on DioError $e");
      return null;
    } catch (e) {
      DIALOG_HELPER("catch $e");
      return null;
    }
  }

  Future<dynamic> POST(String endpoint, {dynamic payload}) async {
    try {
      var _res = await Dio(_zolozBaseOptions).post(endpoint, data: payload);
      return _res.data;
    } on DioError catch (e) {
      DIALOG_HELPER(" on DioError $e");
      return null;
    } catch (e) {
      DIALOG_HELPER("catch $e");
      return null;
    }
  }
}
