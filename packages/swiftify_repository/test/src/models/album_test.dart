import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Album', () {
    const album = Album(
      title: AlbumTitleEnum.reputation,
      albumCover: 'albumCover',
      artist: 'artist',
      releaseDate: [
        ReleaseDate(month: 'month', day: 1, year: 1),
      ],
    );

    const album2 = Album(
      title: AlbumTitleEnum.red,
      albumCover: 'albumCover2',
      artist: 'artist2',
      songs: [
        Song(
          name: 'name',
          artist: 'artist',
          duration: 'duration',
          lyrics: 'lyrics',
          album: AlbumTitleEnum.red,
        ),
      ],
      releaseDate: [
        ReleaseDate(month: 'month', day: 1, year: 1),
      ],
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

  group('ReleaseDate', () {
    const releaseDate = ReleaseDate(month: 'month', day: 1, year: 1);
    const releaseDate2 = ReleaseDate(month: 'month2', day: 2, year: 2);

    test('supports value comparisons', () {
      expect(releaseDate, equals(releaseDate));
      expect(releaseDate, isNot(equals(releaseDate2)));
    });

    test('toString', () {
      expect(releaseDate.toString(), equals('month 1, 1'));
    });
  });
}
