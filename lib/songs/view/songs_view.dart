import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/songs/songs.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class SongsView extends StatelessWidget {
  const SongsView({
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 8,
                  ),
                  child: Text(
                    albumTitle,
                    style: textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return SongCard(
                        coverAlbum: coverAlbum,
                        song: song,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

class SongCard extends StatelessWidget {
  const SongCard({
    required this.coverAlbum,
    required this.song,
    super.key,
  });

  final String? coverAlbum;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AlbumCoverImage(coverAlbum: coverAlbum),
            SongInformation(
              title: song.title,
              duration: song.duration,
              genres: song.genres,
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumCoverImage extends StatelessWidget {
  const AlbumCoverImage({
    required this.coverAlbum,
    super.key,
  });

  final String? coverAlbum;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 80,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          coverAlbum!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SongInformation extends StatelessWidget {
  const SongInformation({
    required this.title,
    required this.duration,
    required this.genres,
    super.key,
  });

  final String title;
  final String? duration;
  final List<String>? genres;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Flexible(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
            Text(duration ?? '', style: textTheme.labelLarge),
            if (genres != null && genres!.isNotEmpty) ...[
              const SizedBox(height: 4),
              SongGenres(genres: genres),
            ],
          ],
        ),
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
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        for (final genre in genres!)
          Row(
            children: [
              Text(
                genre,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              if (genre != genres!.last)
                Text(
                  ' • ',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
