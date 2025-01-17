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
            : SongItem(
                coverAlbum: coverAlbum,
                song: song,
              );
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AlbumSongImage(coverAlbum: coverAlbum),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text('Taylor Swift'),
                  Text(song.duration ?? ''),
                  if (song.genres != null && song.genres!.isNotEmpty) ...[
                    SongGenres(genres: song.genres),
                  ],
                ],
              ),
            ),
          ),
        ],
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
    final height = MediaQuery.sizeOf(context).height * 0.13;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        coverAlbum!,
        fit: BoxFit.cover,
        height: height,
      ),
    );
  }
}

class SongGenres extends StatelessWidget {
  const SongGenres({
    required this.genres,
    super.key,
  });

  final List<String>? genres;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: genres!
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              child: Chip(
                label: Text(
                  genre,
                  style: textTheme.labelMedium,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
