import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';

/// {@template api_client}
/// API client for Swiftify that uses the
/// [Dio](https://pub.dev/packages/dio) package.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    Dio? dio,
    List<Interceptor>? interceptors,
  }) : _dio = dio ?? Dio() {
    interceptors?.forEach((element) {
      dio?.interceptors.add(element);
    });
  }

  /// [Dio] used to communicate with the API
  final Dio _dio;

  String get _baseUrl => 'https://taylor-swift-api.sarbo.workers.dev';

  /// GET request to [path] with [queryParameters]
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    late final Response<T> response;
    try {
      response = await _dio.get(
        '$_baseUrl/$path',
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
    } catch (error, stackTrace) {
      _handleHttpError(
        (error is DioException) ? error.response?.statusCode ?? -1 : -1,
        error,
        stackTrace,
      );
    }

    return _handleResponse(response);
  }

  void _handleHttpError(
    int statusCode,
    Object error,
    StackTrace stackTrace,
  ) {
    final exception = switch (statusCode) {
      400 => BadRequestException(error),
      401 => UnauthorizedException(error),
      403 => ForbiddenException(error),
      _ => NetworkException(error),
    };
    Error.throwWithStackTrace(
      exception,
      error is DioException ? error.stackTrace : stackTrace,
    );
  }

  bool _isSuccessful(Response<dynamic> response) {
    final statusCode = response.statusCode ?? -1;
    return statusCode >= 200 && statusCode < 300;
  }

  T? _handleResponse<T>(Response<T> response) {
    final data = response.data;

    if (_isSuccessful(response)) {
      return data;
    } else {
      throw const DeserializationException.emptyResponseBody();
    }
  }
}
