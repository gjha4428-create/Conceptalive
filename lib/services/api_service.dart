import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/app_constants.dart';
import '../core/utils/logger_util.dart';

class APIService {
  static final APIService _instance = APIService._internal();

  late http.Client _client;

  APIService._internal() {
    _client = http.Client();
  }

  factory APIService() {
    return _instance;
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      LoggerUtil.debug('GET request: $endpoint');
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final response = await _client.get(uri).timeout(
        Duration(seconds: AppConstants.apiTimeout),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.error('GET request error: $endpoint', e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, {required Map<String, dynamic> body}) async {
    try {
      LoggerUtil.debug('POST request: $endpoint');
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final response = await _client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(
        Duration(seconds: AppConstants.apiTimeout),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.error('POST request error: $endpoint', e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, {required Map<String, dynamic> body}) async {
    try {
      LoggerUtil.debug('PUT request: $endpoint');
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final response = await _client.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(
        Duration(seconds: AppConstants.apiTimeout),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.error('PUT request error: $endpoint', e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      LoggerUtil.debug('DELETE request: $endpoint');
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final response = await _client.delete(uri).timeout(
        Duration(seconds: AppConstants.apiTimeout),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      return _handleResponse(response);
    } catch (e) {
      LoggerUtil.error('DELETE request error: $endpoint', e);
      rethrow;
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException('Unauthorized');
    } else if (response.statusCode == 403) {
      throw ForbiddenException('Forbidden');
    } else if (response.statusCode == 404) {
      throw NotFoundException('Not found');
    } else if (response.statusCode >= 500) {
      throw ServerException('Server error');
    } else {
      throw APIException('API error: ${response.statusCode}');
    }
  }
}

class APIException implements Exception {
  final String message;
  APIException(this.message);
  @override
  String toString() => 'APIException: $message';
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
  @override
  String toString() => 'TimeoutException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
  @override
  String toString() => 'ForbiddenException: $message';
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
  @override
  String toString() => 'NotFoundException: $message';
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() => 'ServerException: $message';
}
