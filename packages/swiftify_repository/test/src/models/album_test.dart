import 'package:swiftify_data_source/swiftify_data_source.dart';
import 'package:test/test.dart';

void main() {
  group('Album', () {
    const album = Album(
      title: 'title',
      albumCover: 'albumCover',
      releaseDate: 'releaseDate',
    );

    const album2 = Album(
      title: 'title2',
      albumCover: 'albumCover2',
      artistId: 2,
      releaseDate: 'releaseDate2',
    );

    test('supports value comparisons', () {
      expect(album, equals(album));
      expect(album, isNot(equals(album2)));
    });

    test('fromJson', () {
      final json = <String, dynamic>{
        'title': 'Taylor Swift',
        'albumCover': 'albumCover',
        'artist': 'artist',
        'releaseDate': ['month', 1, 12],
      };

      final album = Album.fromJson(json);

      expect(album, equals(album));
    });
  });
}
