import 'package:swiftify_repository/swiftify_repository.dart';
import 'package:test/test.dart';

void main() {
  group('SwiftifyExceptions', () {
    group('GetAlbumsException', () {
      test('toString', () {
        final exception = Exception();
        expect(
          GetAlbumsException(exception).toString(),
          equals('[GetAlbumsException] $exception'),
        );
      });
    });

    group('GetSongsException', () {
      test('toString', () {
        final exception = Exception();
        expect(
          GetSongsException(exception).toString(),
          equals('[GetSongsException] $exception'),
        );
      });
    });
  });
}
