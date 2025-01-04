import 'dart:async';

import 'package:api_client/src/interceptors/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockRequestOptions extends Mock implements RequestOptions {}

class _MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class _MockResponse extends Mock implements Response<dynamic> {}

class _MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class _MockDioError extends Mock implements DioException {}

class _MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

void main() {
  group('LoggingInterceptor', () {
    final log = <String>[];

    late final RequestOptions requestOptions;
    late final RequestInterceptorHandler requestInterceptorHandler;
    late final Response<dynamic> response;
    late final ResponseInterceptorHandler responseInterceptorHandler;
    late final DioException dioError;
    late final ErrorInterceptorHandler errorInterceptorHandler;
    late LoggingInterceptor loggingInterceptor;

    const fakeMethod = 'method';
    const fakeBaseUrl = 'baseUrl';
    const fakePath = 'path';
    const fakeHeaderKey = 'key';
    const fakeHeaderValue = 'value';
    const fakeDataKey = 'key';
    const fakeDataValue = 'value';
    const fakeError = 'error';
    const fakeStatusCode = 1;
    const fakeErrorStatusCode = -1;

    setUpAll(() {
      requestOptions = _MockRequestOptions();
      requestInterceptorHandler = _MockRequestInterceptorHandler();

      response = _MockResponse();
      responseInterceptorHandler = _MockResponseInterceptorHandler();

      final responseError = _MockResponse();
      dioError = _MockDioError();
      errorInterceptorHandler = _MockErrorInterceptorHandler();

      when(() => requestOptions.method).thenReturn(fakeMethod);
      when(() => requestOptions.baseUrl).thenReturn(fakeBaseUrl);
      when(() => requestOptions.path).thenReturn(fakePath);
      when(() => requestOptions.headers)
          .thenReturn(<String, String>{fakeHeaderKey: fakeHeaderValue});
      when(() => requestOptions.queryParameters)
          .thenReturn(<String, String>{fakeDataKey: fakeDataValue});
      when(() => requestOptions.data)
          .thenReturn(<String, String>{fakeDataKey: fakeDataValue});

      when(() => response.statusCode).thenReturn(fakeStatusCode);
      when(() => response.data as String).thenReturn(fakeBaseUrl);

      when(() => responseError.statusCode).thenReturn(fakeErrorStatusCode);
      when(() => dioError.response).thenReturn(responseError);
      when(() => dioError.type).thenReturn(DioExceptionType.unknown);
      when(() => dioError.error).thenReturn(fakeError);
    });

    void Function() overridePrint(void Function() testFn) => () {
          final spec = ZoneSpecification(
            print: (_, __, ___, String msg) {
              log.add(msg);
            },
          );
          return Zone.current.fork(specification: spec).run<void>(testFn);
        };

    group('log enabled', () {
      setUp(() {
        loggingInterceptor = LoggingInterceptor(logEnabled: true);
        log.clear();
      });

      test(
        'prints request on console',
        overridePrint(() {
          loggingInterceptor.onRequest(
            requestOptions,
            requestInterceptorHandler,
          );

          expect(
            log[0],
            equals('[Dio] HTTP Request - $fakeMethod $fakePath'),
          );
          expect(
            log[1],
            equals('[Dio] headers - {"$fakeHeaderKey":"$fakeHeaderValue"}'),
          );
          expect(
            log[2],
            equals('[Dio] queryParameters - {"$fakeDataKey":"$fakeDataValue"}'),
          );
          expect(
            log[3],
            equals('[Dio] body - {"$fakeDataKey":"$fakeDataValue"}'),
          );
        }),
      );

      test(
        'prints responses on console',
        overridePrint(() {
          loggingInterceptor.onResponse(response, responseInterceptorHandler);

          expect(
            log[0],
            equals('[Dio] HTTP Response - $fakeStatusCode $fakeBaseUrl'),
          );
        }),
      );

      test(
        'prints errors on console',
        overridePrint(() {
          loggingInterceptor.onError(dioError, errorInterceptorHandler);

          expect(
            log[0],
            equals(
              '[Dio] HTTP Error - $fakeErrorStatusCode '
              '[DioExceptionType.unknown] $fakeError',
            ),
          );
        }),
      );
    });

    group('log disabled', () {
      setUp(() {
        loggingInterceptor = LoggingInterceptor();
        log.clear();
      });

      test(
        "doesn't print request on console",
        overridePrint(() {
          loggingInterceptor.onRequest(
            requestOptions,
            requestInterceptorHandler,
          );
          expect(log, isEmpty);
        }),
      );

      test(
        "doesn't print responses on console",
        overridePrint(() {
          loggingInterceptor.onResponse(response, responseInterceptorHandler);
          expect(log, isEmpty);
        }),
      );

      test(
        "doesn't print errors on console",
        overridePrint(() {
          loggingInterceptor.onError(dioError, errorInterceptorHandler);
          expect(log, isEmpty);
        }),
      );
    });
  });
}
