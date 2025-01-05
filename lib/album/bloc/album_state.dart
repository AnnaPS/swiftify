part of 'album_bloc.dart';

enum AlbumStatus { initial, loading, success, failure }

class AlbumState extends Equatable {
  const AlbumState({
    this.status = AlbumStatus.initial,
    this.albums = const <Album>[],
  });

  final List<Album> albums;
  final AlbumStatus status;

  bool get isLoading => status == AlbumStatus.loading;
  bool get isSuccess => status == AlbumStatus.success;
  bool get isFailure => status == AlbumStatus.failure;

  AlbumState copyWith({
    List<Album>? albums,
    AlbumStatus? status,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [albums, status];
}
