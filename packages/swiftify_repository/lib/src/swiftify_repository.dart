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

  /// Get Taylor Swift's albums and add the songs to the albums.
  Future<List<Album>> getAlbums() async {
    try {
      final albumsResponse =
          await apiClient.get<List<Map<String, dynamic>>>('albums');
      return albumsResponse?.map(Album.fromJson).toList() ?? <Album>[];
    } catch (e, st) {
      Error.throwWithStackTrace(GetAlbumsException(e), st);
    }
  }

  /// Get all songs from the API.
  Future<List<Song>> getSongsByAlbum({
    required AlbumTitleEnum albumTitle,
  }) async {
    try {
      final songsResponse = await apiClient
          .get<List<Map<String, dynamic>>>('songs/album/$albumTitle');
      return songsResponse?.map(Song.fromJson).toList() ?? <Song>[];
    } catch (e, st) {
      Error.throwWithStackTrace(GetSongsException(e), st);
    }
  }
}
