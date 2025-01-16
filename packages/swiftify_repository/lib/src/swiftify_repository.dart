import 'package:api_client/api_client.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

/// {@template swiftify_repository}
/// Repository to get Taylor Swift information
/// {@endtemplate}
class SwiftifyRepository {
  /// {@macro swiftify_repository}
  SwiftifyRepository({
    ApiClient? apiClient,
  }) : apiClient = apiClient ??
            ApiClient(
              baseUrl: 'http://localhost:8080/api/v1',
            );

  /// The [ApiClient] used to communicate with the API.
  final ApiClient apiClient;

  /// Get Taylor Swift's albums from the API.
  /// Returns a list of [Album]s ordered by release date.
  Future<List<Album>> getAlbums() async {
    try {
      final albumResponse = await apiClient.get<List<dynamic>>('albums');
      return albumResponse
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      Error.throwWithStackTrace(GetAlbumsException(e), st);
    }
  }

  /// Get songs by [albumId] from the API.
  Future<List<Song>> getSongsByAlbum({
    required int albumId,
  }) async {
    try {
      final songsResponse =
          await apiClient.get<List<Map<String, dynamic>>>('albums/$albumId');
      return songsResponse.map(Song.fromJson).toList();
    } catch (e, st) {
      Error.throwWithStackTrace(GetSongsException(e), st);
    }
  }

  /// Get lyrics for a song from the API.
  Future<String> getSongLyrics({
    required int songId,
  }) async {
    try {
      final lyricsResponse =
          await apiClient.get<Map<String, dynamic>>('lyrics/$songId');
      return lyricsResponse['lyrics'] as String? ?? '';
    } catch (e, st) {
      Error.throwWithStackTrace(GetLyricsException(e), st);
    }
  }
}
