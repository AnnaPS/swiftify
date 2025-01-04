import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockDio extends Mock implements Dio {}

class _MockResponse<T> extends Mock implements Response<T> {}

void main() {
  group('ApiClient', () {
    late ApiClient apiClient;
    late Dio httpClient;
    late Response<dynamic> response;
    const fakeBaseUrl = 'http://baseUrl';
    const fakeResponseData = {'key': 'value'};

    setUp(() {
      httpClient = _MockDio();
      apiClient = ApiClient(dio: httpClient);
      response = _MockResponse();

      when(() => httpClient.options).thenReturn(
        BaseOptions(baseUrl: fakeBaseUrl),
      );
    });

    test('can be instantiated', () {
      when(() => httpClient.interceptors).thenReturn(
        Interceptors(),
      );

      expect(
        ApiClient(
          dio: httpClient,
        ),
        isNotNull,
      );
      expect(
        ApiClient(
          dio: httpClient,
          interceptors: [LoggingInterceptor()],
        ),
        isNotNull,
      );
    });

    group('get', () {
      group('throws', () {
        void setUpHttpError(int errorCode) {
          when(
            () => httpClient.get<dynamic>(
              any(),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
            ),
          ).thenThrow(
            DioException.badResponse(
              statusCode: errorCode,
              requestOptions: RequestOptions(),
              response: Response(
                statusCode: errorCode,
                requestOptions: RequestOptions(),
              ),
            ),
          );
        }

        test(
            'expected BadRequestException '
            'on 400 response', () async {
          setUpHttpError(400);
          expect(
            apiClient.get<dynamic>(''),
            throwsA(isA<BadRequestException>()),
          );
        });

        test(
            'expected UnauthorizedException '
            'on 401 response', () async {
          setUpHttpError(401);
          expect(
            apiClient.get<dynamic>(''),
            throwsA(isA<UnauthorizedException>()),
          );
        });

        test(
            'expected ForbiddenException '
            'on 403 response', () async {
          setUpHttpError(403);
          expect(
            apiClient.get<dynamic>(''),
            throwsA(isA<ForbiddenException>()),
          );
        });

        test(
            'expected NetworkException '
            'on other response', () async {
          setUpHttpError(-1);
          expect(
            apiClient.get<dynamic>(''),
            throwsA(isA<NetworkException>()),
          );
        });
      });

      test(
          'returns data if response is successful '
          'with request headers', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(fakeResponseData);

        when(
          () => httpClient.get<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => response);

        final data = await apiClient.get<dynamic>(
          '',
          headers: {'key': 'value'},
        );
        expect(
          data,
          equals(fakeResponseData),
        );
      });

      test('returns data if response is successful (200 with non-empty data)',
          () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(fakeResponseData);

        when(
          () => httpClient.get<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => response);

        final data = await apiClient.get<dynamic>('');
        expect(
          data,
          equals(fakeResponseData),
        );
      });

      test('returns data if response is successful (204 with empty data)',
          () async {
        when(() => response.statusCode).thenReturn(204);
        when(() => response.data).thenReturn(null);

        when(
          () => httpClient.get<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => response);

        final data = await apiClient.get<dynamic>('');
        expect(
          data,
          equals(null),
        );
      });
    });
  });
}
