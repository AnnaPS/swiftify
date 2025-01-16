import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/song/song.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class SongView extends StatelessWidget {
  const SongView({
    required this.albumTitle,
    required this.coverAlbum,
    required this.releaseDate,
    super.key,
  });

  final String albumTitle;
  final String? coverAlbum;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    final songs = context.select((SongBloc bloc) => bloc.state.songs);

    final isLoading = context.select((SongBloc bloc) => bloc.state.isLoading);

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : SongItem(coverAlbum: coverAlbum, song: song);
      },
    );
  }
}

class SongItem extends StatelessWidget {
  const SongItem({
    required this.coverAlbum,
    required this.song,
    super.key,
  });

  final String? coverAlbum;
  final Song song;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: AlbumSongImage(coverAlbum: coverAlbum),
        title: Text(
          song.title,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Taylor Swift'),
            Text(song.duration ?? ''),
            if (song.genres != null && song.genres!.isNotEmpty) ...[
              Row(
                children: song.genres!
                    .map(
                      (genre) => Chip(
                        label: Text(genre, style: textTheme.labelMedium),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AlbumSongImage extends StatelessWidget {
  const AlbumSongImage({
    required this.coverAlbum,
    super.key,
  });

  final String? coverAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        coverAlbum!,
        height: 100,
      ),
    );
  }
}
