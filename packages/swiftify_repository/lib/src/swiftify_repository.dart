import 'package:api_client/api_client.dart';

/// {@template swiftify_repository}
/// Repository to get Taylor Swift information
/// {@endtemplate}
class SwiftifyRepository {
  /// {@macro swiftify_repository}
  SwiftifyRepository({
    ApiClient? apiClient,
  }) : apiClient = apiClient ?? ApiClient();

  final ApiClient apiClient;
}
