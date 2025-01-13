// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/songs/song.dart';
import 'package:swiftify_data_source/swiftify_data_source.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class _MockSwiftifyRepository extends Mock implements SwiftifyRepository {}

void main() {
  group('SongBloc', () {
    late SwiftifyRepository swiftifyRepository;

    setUp(() {
      swiftifyRepository = _MockSwiftifyRepository();
    });

    test('initial state is SongState', () {
      expect(
        SongBloc(
          swiftifyRepository: swiftifyRepository,
        ).state,
        const SongState(),
      );
    });

    group('SongsByAlbumRequested', () {
      blocTest<SongBloc, SongState>(
        'emits state with updated songs',
        setUp: () {
          when(
            () => swiftifyRepository.getSongsByAlbum(
              albumId: 1,
            ),
          ).thenAnswer((_) async => [Song(title: 'willow')]);
        },
        build: () => SongBloc(
          swiftifyRepository: swiftifyRepository,
        ),
        act: (bloc) => bloc.add(
          SongsRequested(
            albumId: 1,
          ),
        ),
        expect: () => [
          const SongState(status: SongStatus.loading),
          SongState(
            songs: const [Song(title: 'willow')],
            status: SongStatus.success,
          ),
        ],
      );

      blocTest<SongBloc, SongState>(
        'emits failure when an error occurs',
        setUp: () {
          when(
            () => swiftifyRepository.getSongsByAlbum(
              albumId: 1,
            ),
          ).thenThrow(Exception());
        },
        build: () => SongBloc(
          swiftifyRepository: swiftifyRepository,
        ),
        act: (bloc) => bloc.add(
          SongsRequested(
            albumId: 1,
          ),
        ),
        expect: () => <SongState>[
          const SongState(status: SongStatus.loading),
          const SongState(status: SongStatus.failure),
        ],
      );
    });
  });
}
