import 'package:dio/dio.dart';
import 'package:housewise/data/app_url/app_url.dart';
import 'package:housewise/data/exceptions/app_exception.dart';
import 'package:housewise/data/network/base_api.dart';

class NetworkServicesApi implements BaseApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppUrl.BASE_URL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  @override
  Future<dynamic> postApi(String endpoint, data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  @override
  Future<dynamic> getApi(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      print(response.statusCode);
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
