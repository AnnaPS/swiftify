// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/songs/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

void main() {
  group('SongState', () {
    test('supports value comparisons', () {
      expect(
        SongState(
          songs: const [Song(title: 'name')],
          status: SongStatus.loading,
        ),
        equals(
          SongState(
            songs: const [Song(title: 'name')],
            status: SongStatus.loading,
          ),
        ),
      );

      expect(
        SongState(
          songs: const [Song(title: 'name')],
          status: SongStatus.loading,
        ),
        isNot(
          equals(
            SongState(
              songs: const [Song(title: 'different')],
              status: SongStatus.loading,
            ),
          ),
        ),
      );
    });

    test('copyWith comparisons', () {
      expect(
        SongState(
                songs: const [Song(title: 'name')], status: SongStatus.loading)
            .copyWith(),
        equals(
          SongState(
            songs: const [Song(title: 'name')],
            status: SongStatus.loading,
          ),
        ),
      );

      expect(
        SongState(
                songs: const [Song(title: 'name')], status: SongStatus.loading)
            .copyWith(songs: [Song(title: 'different')]),
        equals(
          SongState(
            songs: const [Song(title: 'different')],
            status: SongStatus.loading,
          ),
        ),
      );

      expect(
        SongState(
                songs: const [Song(title: 'name')], status: SongStatus.loading)
            .copyWith(status: SongStatus.success),
        equals(
          SongState(
            songs: const [Song(title: 'name')],
            status: SongStatus.success,
          ),
        ),
      );
    });

    test('isSuccess', () {
      final state = SongState(status: SongStatus.success);
      expect(state.isSuccess, isTrue);
    });

    test('isFailure', () {
      final state = SongState(status: SongStatus.failure);
      expect(state.isFailure, isTrue);
    });

    test('isLoading', () {
      final state = SongState(status: SongStatus.loading);
      expect(state.isLoading, isTrue);
    });
  });
}
