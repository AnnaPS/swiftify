part of 'songs_bloc.dart';

enum SongsStatus { initial, loading, success, failure }

class SongsState extends Equatable {
  const SongsState({
    this.status = SongsStatus.initial,
    this.songs = const <Song>[],
  });

  final List<Song> songs;
  final SongsStatus status;

  bool get isLoading => status == SongsStatus.loading;
  bool get isSuccess => status == SongsStatus.success;

  SongsState copyWith({
    List<Song>? songs,
    SongsStatus? status,
  }) {
    return SongsState(
      songs: songs ?? this.songs,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [songs, status];
}
