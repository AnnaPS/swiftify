import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/album/album.dart';

void main() {
  group('AlbumEvent', () {
    group('AlbumsRequested', () {
      test('returns AlbumsRequested', () {
        final event = AlbumsRequested();
        expect(event, equals(AlbumsRequested()));
      });
    });
  });
}
