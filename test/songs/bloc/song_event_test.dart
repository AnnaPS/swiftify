// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/songs/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

void main() {
  group('SongsEvent', () {
    group('SongsByAlbumRequested', () {
      test('supports value comparisons', () {
        expect(
          SongsByAlbumRequested(albumTitle: AlbumTitleEnum.taylorSwift),
          equals(SongsByAlbumRequested(albumTitle: AlbumTitleEnum.taylorSwift)),
        );

        expect(
          SongsByAlbumRequested(albumTitle: AlbumTitleEnum.taylorSwift),
          isNot(
            equals(SongsByAlbumRequested(albumTitle: AlbumTitleEnum.fearless)),
          ),
        );
      });
    });
  });
}
