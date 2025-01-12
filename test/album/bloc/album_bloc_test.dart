// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class _MockSwiftifyRepository extends Mock implements SwiftifyRepository {}

void main() {
  group('AlbumBloc', () {
    late SwiftifyRepository swiftifyRepository;

    setUp(() {
      swiftifyRepository = _MockSwiftifyRepository();
    });

    test('initial state is AlbumState', () {
      expect(
        AlbumBloc(
          swiftifyRepository: swiftifyRepository,
        ).state,
        const AlbumState(),
      );
    });

    group('AlbumsRequested', () {
      blocTest<AlbumBloc, AlbumState>(
        'emits state with updated albums',
        setUp: () {
          when(
            () => swiftifyRepository.getAlbums(),
          ).thenAnswer((_) async => [Album(title: AlbumIdEnum.evermore)]);
        },
        build: () => AlbumBloc(
          swiftifyRepository: swiftifyRepository,
        ),
        act: (bloc) => bloc.add(AlbumsRequested()),
        expect: () => [
          const AlbumState(status: AlbumStatus.loading),
          AlbumState(
            albums: const [Album(title: AlbumIdEnum.evermore)],
            status: AlbumStatus.success,
          ),
        ],
      );

      blocTest<AlbumBloc, AlbumState>(
        'emits failure when an error occurs',
        setUp: () {
          when(
            () => swiftifyRepository.getAlbums(),
          ).thenThrow(Exception());
        },
        build: () => AlbumBloc(
          swiftifyRepository: swiftifyRepository,
        ),
        act: (bloc) => bloc.add(AlbumsRequested()),
        expect: () => <AlbumState>[
          const AlbumState(status: AlbumStatus.loading),
          const AlbumState(status: AlbumStatus.failure),
        ],
      );
    });
  });
}
