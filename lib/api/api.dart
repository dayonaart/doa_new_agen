import 'package:dio/dio.dart';
import 'package:mobilenew/widget/widgets.dart';

class Api {
  final BaseOptions _baseOptions = BaseOptions(
      baseUrl: "https://ibnux.github.io/data-indonesia/",
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
}