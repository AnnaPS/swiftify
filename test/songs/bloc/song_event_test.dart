// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/song/song.dart';

void main() {
  group('SongsEvent', () {
    group('SongsByAlbumRequested', () {
      test('supports value comparisons', () {
        expect(
          SongsRequested(albumId: 2),
          equals(SongsRequested(albumId: 2)),
        );

        expect(
          SongsRequested(albumId: 1),
          isNot(
            equals(SongsRequested(albumId: 2)),
          ),
        );
      });
    });
  });
}
