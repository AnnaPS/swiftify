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
      final albums = albumsResponse?.map(Album.fromJson).toList() ?? <Album>[];

      final songsResponse = await getSongs();

      for (var i = 0; i < albums.length; i++) {
        // Get the album and add the songs to it
        final album = albums[i];
        // Add the songs to the album. Create a new list, because the original
        // list is unmodifiable.
        final songs = List<Song>.from(album.songs)
          ..addAll(songsResponse.where((song) => song.album == album.title));

        // Update the album with the new list of songs
        albums[i] = album.copyWith(songs: songs);
      }

      return albums;
    } catch (e, st) {
      Error.throwWithStackTrace(GetAlbumsException(e), st);
    }
  }

  /// Get all songs from the API.
  Future<List<Song>> getSongs() async {
    try {
      final songsResponse =
          await apiClient.get<List<Map<String, dynamic>>>('songs');
      return songsResponse?.map(Song.fromJson).toList() ?? <Song>[];
    } catch (e, st) {
      Error.throwWithStackTrace(GetSongsException(e), st);
    }
  }
}
