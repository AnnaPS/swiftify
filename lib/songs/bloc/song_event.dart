part of 'song_bloc.dart';

sealed class SongEvent extends Equatable {
  const SongEvent();
}

class SongsByAlbumRequested extends SongEvent {
  const SongsByAlbumRequested({
    required this.albumTitle,
  });

  final AlbumTitleEnum albumTitle;

  @override
  List<Object> get props => [albumTitle];
}
