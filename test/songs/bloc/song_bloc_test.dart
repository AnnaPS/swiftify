// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/songs/songs.dart';
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
        const SongsState(),
      );
    });

    group('SongsByAlbumRequested', () {
      blocTest<SongBloc, SongsState>(
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
          const SongsState(status: SongsStatus.loading),
          SongsState(
            songs: const [Song(title: 'willow')],
            status: SongsStatus.success,
          ),
        ],
      );

      blocTest<SongBloc, SongsState>(
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
        expect: () => <SongsState>[
          const SongsState(status: SongsStatus.loading),
          const SongsState(status: SongsStatus.failure),
        ],
      );
    });
  });
}
