import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/songs/songs.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({
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
          title: const Text('Songs'),
        ),
        body: SongsView(
          albumTitle: albumTitle ?? '',
          coverAlbum: coverAlbum,
          releaseDate: albumReleaseDate ?? '',
        ),
      ),
    );
  }
}
