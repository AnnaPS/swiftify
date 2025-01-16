part of 'song_bloc.dart';

sealed class SongEvent extends Equatable {
  const SongEvent();
}

class SongsRequested extends SongEvent {
  const SongsRequested({
    required this.albumId,
  });

  final int albumId;

  @override
  List<Object> get props => [albumId];
}
