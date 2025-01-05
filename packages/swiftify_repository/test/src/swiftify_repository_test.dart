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
        'albumCover': 'albumCover',
        'artist': 'Taylor Swift',
        'releaseDate': ['month', 1, 12],
      };

      test('returns a list of albums', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>('albums'),
        ).thenAnswer((_) async => [albumJson]);

        final albums = await repository.getAlbums();

        expect(albums, isNotEmpty);
        expect(albums.first.title, AlbumTitleEnum.reputation);
      });

      test('returns an empty list if the albums response is null', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>('albums'),
        ).thenAnswer((_) async => null);

        final albums = await repository.getAlbums();

        expect(albums, isEmpty);
      });

      test('throws a GetAlbumsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'albums',
          ),
        ).thenThrow(Exception('error'));

        expect(
          () async => repository.getAlbums(),
          throwsA(isA<GetAlbumsException>()),
        );
      });
    });

    group('getSongsByAlbum', () {
      final songJson = <String, dynamic>{
        'name': 'Are you ready for it?',
        'artist': 'Taylor Swift',
        'duration': '1',
        'lyrics': 'lyrics',
        'album': 'Reputation',
      };

      test('returns a list of songs by album', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'songs/album/${AlbumTitleEnum.reputation}',
          ),
        ).thenAnswer((_) async => [songJson]);

        final songs = await repository.getSongsByAlbum(
          albumTitle: AlbumTitleEnum.reputation,
        );

        expect(songs, isNotEmpty);
        expect(songs.first.name, 'Are you ready for it?');
      });

      test('returns an empty list if the songs response is empty', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'songs/album/${AlbumTitleEnum.reputation}',
          ),
        ).thenAnswer((_) async => []);

        final songs = await repository.getSongsByAlbum(
          albumTitle: AlbumTitleEnum.reputation,
        );

        expect(songs, isEmpty);
      });

      test('throws a GetSongsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'songs/album/${AlbumTitleEnum.red}',
          ),
        ).thenThrow(Exception('error'));

        expect(
          () async =>
              repository.getSongsByAlbum(albumTitle: AlbumTitleEnum.red),
          throwsA(isA<GetSongsException>()),
        );
      });
    });
  });
}
