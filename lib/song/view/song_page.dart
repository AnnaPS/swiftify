import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/song/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class SongPage extends StatelessWidget {
  const SongPage({
    required this.albumId,
    this.albumTitle,
    this.coverAlbum,
    this.albumReleaseDate,
    super.key,
  });

  final int albumId;
  final String? albumTitle;
  final String? coverAlbum;
  final String? albumReleaseDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongBloc(
        swiftifyRepository: context.read<SwiftifyRepository>(),
      )..add(
          SongsRequested(albumId: albumId),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(albumTitle ?? ''),
        ),
        body: SongView(
          albumTitle: albumTitle ?? '',
          coverAlbum: coverAlbum,
          releaseDate: albumReleaseDate ?? '',
        ),
      ),
    );
  }
}
