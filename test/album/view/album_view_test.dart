// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

import '../../helpers/helpers.dart';

class _MockAlbumBloc extends MockBloc<AlbumEvent, AlbumState>
    implements AlbumBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  late AlbumBloc albumBloc;
  late GoRouter goRouter;
  final albums = List.generate(
    3,
    (index) => Album(
      title: 'title $index',
      albumId: index,
      coverAlbum: 'coverAlbum $index',
      releaseDate: 'releaseDate $index',
    ),
  );

  setUp(() {
    albumBloc = _MockAlbumBloc();
    goRouter = _MockGoRouter();
  });

  testWidgets('renders a CircularProgessIndicator when isLoading',
      (tester) async {
    when(() => albumBloc.state)
        .thenReturn(const AlbumState(status: AlbumStatus.loading));

    await tester.pumpApp(
      BlocProvider.value(
        value: albumBloc,
        child: AlbumView(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders AlbumsHeader and AlbumsContent when isSuccess',
      (tester) async {
    when(() => albumBloc.state).thenReturn(
      AlbumState(
        status: AlbumStatus.success,
        albums: albums,
      ),
    );

    await mockNetworkImages(
      () async => tester.pumpApp(
        BlocProvider.value(
          value: albumBloc,
          child: AlbumView(),
        ),
      ),
    );

    expect(find.byType(AlbumsHeader), findsOneWidget);
    expect(find.byType(AlbumsContent), findsOneWidget);
  });

  testWidgets('renders a Text widget with an error message when isFailure',
      (tester) async {
    when(() => albumBloc.state)
        .thenReturn(AlbumState(status: AlbumStatus.failure));

    await tester.pumpApp(
      BlocProvider.value(
        value: albumBloc,
        child: AlbumView(),
      ),
    );

    expect(find.text('Failed to fetch albums'), findsOneWidget);
  });

  testWidgets('navigate to SongsPage when click on a song', (tester) async {
    when(() => goRouter.go(any())).thenAnswer((_) async => true);
    when(() => albumBloc.state).thenReturn(
      AlbumState(
        status: AlbumStatus.success,
        albums: albums,
      ),
    );

    await mockNetworkImages(
      () async => tester.pumpApp(
        BlocProvider.value(
          value: albumBloc,
          child: AlbumView(),
        ),
        goRouter: goRouter,
      ),
    );

    await tester.tap(find.text('title 0'));
    await tester.pumpAndSettle();
    verify(() => goRouter.go(any())).called(1);
  });
}
