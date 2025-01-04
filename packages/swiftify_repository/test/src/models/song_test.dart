import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Song', () {
    const song = Song(
      artist: 'artist',
      album: AlbumTitleEnum.reputation,
      duration: '1',
      lyrics: 'lyrics',
      name: 'name',
    );

    const song2 = Song(
      artist: 'artist2',
      album: AlbumTitleEnum.folklore,
      duration: '2',
      lyrics: 'lyrics2',
      name: 'name2',
    );

    test('supports value comparisons', () {
      expect(song, equals(song));
      expect(song, isNot(equals(song2)));
    });

    test('fromJson', () {
      final json = <String, dynamic>{
        'name': 'name',
        'artist': 'artist',
        'duration': '1',
        'lyrics': 'lyrics',
        'album': 'Reputation',
      };

      final song = Song.fromJson(json);

      expect(song, equals(song));
    });
  });
}
