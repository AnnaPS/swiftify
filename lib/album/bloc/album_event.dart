part of 'album_bloc.dart';

sealed class AlbumEvent {}

class AlbumsRequested extends AlbumEvent {
  AlbumsRequested();
}
