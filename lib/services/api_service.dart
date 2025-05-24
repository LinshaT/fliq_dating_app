import 'package:dio/dio.dart';
import 'package:fliq_dating_app/services/chat_service.dart';

class BaseApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://test.myfliqapp.com/api/v1'));
  final ChatService _storageService = ChatService();

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final token = await _storageService.getToken();
      final headers = token != null ? {'Authorization': 'Bearer $token'} : null;
      return await _dio.post(endpoint, data: data, options: Options(headers: headers));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final token = await _storageService.getToken();
      final headers = token != null ? {'Authorization': 'Bearer $token'} : null;
      return await _dio.get(endpoint, options: Options(headers: headers));
    } catch (e) {
      rethrow;
    }
  }
}
