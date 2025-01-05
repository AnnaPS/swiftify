part of 'album_bloc.dart';

sealed class AlbumEvent extends Equatable {}

class AlbumsRequested extends AlbumEvent {
  AlbumsRequested();

  @override
  List<Object> get props => [];
}
