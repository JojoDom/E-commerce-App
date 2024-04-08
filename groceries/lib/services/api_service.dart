import 'package:dio/dio.dart';
import 'package:groceries/utilities/constants.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class ApiService { 
  final Dio _dio;
  ApiService() : _dio = Dio(BaseOptions()) {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: false,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
}

Future<dynamic> post( Map<String, dynamic> body) async {
    try {
      final response = await _dio.post('https://backend.scandocflow.com/v1/api/documents/extract?access_token=e0YG9Z5XgUXhjYhiyUocHCR2cuwnEoO9LklI1XbOCs38FFhbrH87CVRCURr0sKY1',
          data: body);
      if (response.statusCode == 200 ||response.statusCode == 201) {
        final responseData = response.data;
        return responseData;
      } else {
        throw Exception('API Error - Status Code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      Logger().e('DioError: ${e.message}');
      rethrow;
    } catch (e) {
      Logger().e('Error: $e');
    }
  }}
