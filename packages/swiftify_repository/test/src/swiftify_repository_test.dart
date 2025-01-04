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

      final songJson = <String, dynamic>{
        'name': 'Are you ready for it?',
        'artist': 'Taylor Swift',
        'duration': '1',
        'lyrics': 'lyrics',
        'album': 'Reputation',
      };

      final song2Json = <String, dynamic>{
        'name': 'Fearless',
        'artist': 'Taylor Swift',
        'duration': '1',
        'lyrics': 'lyrics',
        'album': 'Fearless',
      };

      test('returns a list of albums with songs', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>('albums'),
        ).thenAnswer((_) async => [albumJson]);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>('songs'),
        ).thenAnswer((_) async => [songJson, song2Json]);

        final albums = await repository.getAlbums();

        expect(albums, isNotEmpty);
        expect(albums.first.title, AlbumTitleEnum.reputation);
        expect(albums.first.songs, isNotEmpty);
        expect(albums.first.songs, hasLength(1));
        expect(albums.first.songs.first.name, 'Are you ready for it?');
      });

      test('returns an empty list if the albums response is null', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>('albums'),
        ).thenAnswer((_) async => null);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>('songs'),
        ).thenAnswer((_) async => [songJson]);

        final albums = await repository.getAlbums();

        expect(albums, isEmpty);
      });

      //copy with
      test('returns same object when no properties are passed', () {
        expect(const Album().copyWith(), const Album());
      });

      test('returns object with updated songs when present', () {
        final songs = <Song>[const Song(name: 'song')];
        expect(
          const Album().copyWith(songs: songs),
          Album(
            songs: songs,
          ),
        );
      });

      test('returns an empty list if the songs response is empty', () async {
        when(
          () => apiClient.get<List<Map<String, dynamic>>>('songs'),
        ).thenAnswer((_) async => []);

        final songs = await repository.getSongs();

        expect(songs, isEmpty);
      });

      test('throws a GetSongsException on error', () async {
        final repository = SwiftifyRepository(apiClient: apiClient);

        when(
          () => apiClient.get<List<Map<String, dynamic>>>(
            'songs',
          ),
        ).thenThrow(Exception('error'));

        expect(
          () async => repository.getSongs(),
          throwsA(isA<GetSongsException>()),
        );
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
  });
}
