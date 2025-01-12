import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Song', () {
    const song = Song(
      albumId: 1,
      songId: 1,
      title: 'title',
    );

    const song2 = Song(
      albumId: 2,
      songId: 2,
      title: 'title2',
    );

    test('supports value comparisons', () {
      expect(song, equals(song));
      expect(song, isNot(equals(song2)));
    });

    test('fromJson', () {
      final json = <String, dynamic>{
        'title': 'title',
        'artist_id': 1,
        'song_id': 1,
      };

      final song = Song.fromJson(json);

      expect(song, equals(song));
    });
  });
}
