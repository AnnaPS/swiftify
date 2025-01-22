part of 'song_bloc.dart';

enum SongStatus { initial, loading, success, failure }

class SongState extends Equatable {
  const SongState({
    this.status = SongStatus.initial,
    this.songs = const <Song>[],
  });

  final List<Song> songs;
  final SongStatus status;

  bool get isLoading => status == SongStatus.loading;
  bool get isSuccess => status == SongStatus.success;

  SongState copyWith({
    List<Song>? songs,
    SongStatus? status,
  }) {
    return SongState(
      songs: songs ?? this.songs,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [songs, status];
}
