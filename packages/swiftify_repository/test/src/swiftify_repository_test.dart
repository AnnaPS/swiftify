import 'package:api_client/api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('SwiftifyRepository', () {
    late ApiClient apiClient;

    setUp(() {
      apiClient = _MockApiClient();
    });

    test('can be instantiated', () {
      expect(SwiftifyRepository(), isNotNull);
    });

    test('can be instantiated with an ApiClient', () {
      expect(
        SwiftifyRepository(
          apiClient: apiClient,
        ),
        isNotNull,
      );
    });
  });
}
