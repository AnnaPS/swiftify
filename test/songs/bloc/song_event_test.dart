// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/songs/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

void main() {
  group('SongsEvent', () {
    group('SongsByAlbumRequested', () {
      test('supports value comparisons', () {
        expect(
          SongsRequested(albumTitle: AlbumIdEnum.taylorSwift),
          equals(SongsRequested(albumTitle: AlbumIdEnum.taylorSwift)),
        );

        expect(
          SongsRequested(albumTitle: AlbumIdEnum.taylorSwift),
          isNot(
            equals(SongsRequested(albumTitle: AlbumIdEnum.fearless)),
          ),
        );
      });
    });
  });
}
