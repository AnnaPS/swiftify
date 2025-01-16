import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify/song/song.dart';

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
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AlbumsHeader(),
                  Expanded(
                    child: AlbumsContent(),
                  ),
                ],
              )
            : const Text('Failed to fetch albums');
  }
}

class AlbumsHeader extends StatelessWidget {
  const AlbumsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Taylor Swift',
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover her discography, from her first album to the latest one.',
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class AlbumsContent extends StatelessWidget {
  const AlbumsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final albums = context.select((AlbumBloc bloc) => bloc.state.albums);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return GestureDetector(
          onTap: () => context.push(
            '${AlbumPage.routeName}/${SongPage.routeName}',
            extra: AlbumData(
              albumId: album.albumId,
              albumTitle: album.title,
              coverAlbum: album.coverAlbum,
              albumReleaseDate: album.releaseDate,
            ),
          ),
          child: AlbumItem(
            title: album.title,
            releaseDate: album.releaseDate,
            coverAlbum: album.coverAlbum,
          ),
        );
      },
    );
  }
}

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    required this.coverAlbum,
    required this.title,
    required this.releaseDate,
    super.key,
  });

  final String? coverAlbum;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AlbumImage(coverAlbum: coverAlbum),
          const AlbumImageGradient(),
          Positioned(
            bottom: 4,
            left: 8,
            right: 8,
            child: AlbumInfo(
              title: title,
              releaseDate: releaseDate,
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({
    required this.title,
    required this.releaseDate,
    super.key,
  });

  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          releaseDate,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    required this.coverAlbum,
    super.key,
  });

  final String? coverAlbum;

  @override
  Widget build(BuildContext context) {
    if (coverAlbum != null) {
      return Image.network(
        coverAlbum!,
        fit: BoxFit.cover,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class AlbumImageGradient extends StatelessWidget {
  const AlbumImageGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0, red: 0, green: 0, blue: 0),
            Colors.black.withValues(alpha: .5, red: 0, green: 0, blue: 0),
            Colors.black.withValues(alpha: .5, red: 0, green: 0, blue: 0),
          ],
          stops: const [0, 0.5, 1.0],
        ),
      ),
    );
  }
}
