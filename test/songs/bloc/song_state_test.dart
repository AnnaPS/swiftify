// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/songs/songs.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

void main() {
  group('SongState', () {
    test('supports value comparisons', () {
      expect(
        SongsState(
          songs: const [Song(title: 'name')],
          status: SongsStatus.loading,
        ),
        equals(
          SongsState(
            songs: const [Song(title: 'name')],
            status: SongsStatus.loading,
          ),
        ),
      );

      expect(
        SongsState(
          songs: const [Song(title: 'name')],
          status: SongsStatus.loading,
        ),
        isNot(
          equals(
            SongsState(
              songs: const [Song(title: 'different')],
              status: SongsStatus.loading,
            ),
          ),
        ),
      );
    });

    test('copyWith comparisons', () {
      expect(
        SongsState(
          songs: const [Song(title: 'name')],
          status: SongsStatus.loading,
        ).copyWith(),
        equals(
          SongsState(
            songs: const [Song(title: 'name')],
            status: SongsStatus.loading,
          ),
        ),
      );

      expect(
        SongsState(
          songs: const [Song(title: 'name')],
          status: SongsStatus.loading,
        ).copyWith(songs: [Song(title: 'different')]),
        equals(
          SongsState(
            songs: const [Song(title: 'different')],
            status: SongsStatus.loading,
          ),
        ),
      );

      expect(
        SongsState(
          songs: const [Song(title: 'name')],
          status: SongsStatus.loading,
        ).copyWith(status: SongsStatus.success),
        equals(
          SongsState(
            songs: const [Song(title: 'name')],
            status: SongsStatus.success,
          ),
        ),
      );
    });

    test('isSuccess', () {
      final state = SongsState(status: SongsStatus.success);
      expect(state.isSuccess, isTrue);
    });

    test('isLoading', () {
      final state = SongsState(status: SongsStatus.loading);
      expect(state.isLoading, isTrue);
    });
  });
}
