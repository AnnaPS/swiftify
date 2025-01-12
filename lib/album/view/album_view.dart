import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/album/bloc/album_bloc.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((AlbumBloc bloc) => bloc.state.isLoading);
    final isSuccess = context.select((AlbumBloc bloc) => bloc.state.isSuccess);

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : isSuccess
            ? const AlbumList()
            : const Text('Failed to fetch albums');
  }
}

class AlbumList extends StatelessWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = context.select((AlbumBloc bloc) => bloc.state.albums);
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return ListTile(
          title: Text(album.title),
          subtitle: Text(album.releaseDate),
        );
      },
    );
  }
}
