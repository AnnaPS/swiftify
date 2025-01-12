import 'package:api_client/api_client.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

/// {@template swiftify_repository}
/// Repository to get Taylor Swift information
/// {@endtemplate}
class SwiftifyRepository {
  /// {@macro swiftify_repository}
  SwiftifyRepository({
    ApiClient? apiClient,
  }) : apiClient = apiClient ?? ApiClient();

  /// The [ApiClient] used to communicate with the API.
  final ApiClient apiClient;

  /// Get Taylor Swift's albums from the API.
  Future<List<Album>> getAlbums() async {
    try {
      final response = await apiClient.get<List<dynamic>>('albums');

      return response
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <Album>[]
        ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
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
      return songsResponse?.map(Song.fromJson).toList() ?? <Song>[];
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
      return lyricsResponse?['lyrics'] as String? ?? '';
    } catch (e, st) {
      Error.throwWithStackTrace(GetLyricsException(e), st);
    }
  }
}
