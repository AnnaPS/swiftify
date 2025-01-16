import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/song/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class SongPage extends StatelessWidget {
  const SongPage({
    required this.albumData,
    super.key,
  });

  factory SongPage.pageBuilder(_, GoRouterState? state) {
    final albumData = state!.extra! as AlbumData;
    return SongPage(albumData: albumData);
  }

  final AlbumData albumData;

  static const routeName = 'songs';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongBloc(
        swiftifyRepository: context.read<SwiftifyRepository>(),
      )..add(
          SongsRequested(
            albumId: albumData.albumId,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(albumData.albumTitle),
        ),
        body: SongView(
          albumTitle: albumData.albumTitle,
          coverAlbum: albumData.coverAlbum,
          releaseDate: albumData.albumReleaseDate,
        ),
      ),
    );
  }
}
