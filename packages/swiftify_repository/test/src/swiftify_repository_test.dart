import 'package:api_client/api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('SwiftifyRepository', () {
    late ApiClient apiClient;
    late SwiftifyRepository repository;

    setUp(() {
      apiClient = _MockApiClient();
      repository = SwiftifyRepository(apiClient: apiClient);
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

    group('getAlbums', () {
      final albumJson = <String, dynamic>{
        'title': 'Reputation',
        'album_id': 1,
        'release_date': '2017-11-10',
      };

      test('returns a list of albums', () async {
        when(
          () => apiClient.get<List<dynamic>>('albums'),
        ).thenAnswer((_) async => [albumJson]);

        final albums = await repository.getAlbums();

        expect(albums, isNotEmpty);
        expect(albums.first.title, 'Reputation');
      });

      test('throws a GetAlbumsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<List<dynamic>>('albums'),
        ).thenThrow(Exception('error'));

        expect(
          () async => repository.getAlbums(),
          throwsA(isA<GetAlbumsException>()),
        );
      });
    });

    group('getSongsByAlbum', () {
      final songJson = <String, dynamic>{
        'title': 'Are you ready for it?',
        'artist_id': 1,
        'song_id': 1,
      };

      test('returns a list of songs by album', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'albums/1',
          ),
        ).thenAnswer((_) async => [songJson]);

        final songs = await repository.getSongsByAlbum(
          albumId: 1,
        );

        expect(songs, isNotEmpty);
        expect(songs.first.title, 'Are you ready for it?');
      });

      test('returns an empty list if the songs response is empty', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'albums/1',
          ),
        ).thenAnswer((_) async => []);

        final songs = await repository.getSongsByAlbum(
          albumId: 1,
        );

        expect(songs, isEmpty);
      });

      test('throws a GetSongsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'albums/1',
          ),
        ).thenThrow(Exception('error'));

        expect(
          () async => repository.getSongsByAlbum(albumId: 1),
          throwsA(isA<GetSongsException>()),
        );
      });
    });

    group('getSongLyrics', () {
      final lyricsJson = <String, dynamic>{
        'lyrics': 'lyrics',
        'song_id': 1,
        'album_id': 1,
      };

      test('returns song lyrics', () async {
        when(
          () => apiClient.get<Map<String, dynamic>>(
            'lyrics/1',
          ),
        ).thenAnswer((_) async => lyricsJson);

        final lyrics = await repository.getSongLyrics(
          songId: 1,
        );

        expect(lyrics, isNotNull);
        expect(lyrics, 'lyrics');
      });

      test('throws a GetLyricsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<Map<String, dynamic>>(
            'lyrics/1',
          ),
        ).thenThrow(Exception('error'));

        expect(
          () async => repository.getSongLyrics(
            songId: 1,
          ),
          throwsA(isA<GetLyricsException>()),
        );
      });
    });
  });
}
