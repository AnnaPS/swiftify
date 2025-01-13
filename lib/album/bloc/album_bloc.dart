import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swiftify_data_source/swiftify_data_source.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc({
    required SwiftifyRepository swiftifyRepository,
  })  : _swiftifyRepository = swiftifyRepository,
        super(const AlbumState()) {
    on<AlbumsRequested>(_onAlbumsRequested);
  }

  final SwiftifyRepository _swiftifyRepository;

  Future<void> _onAlbumsRequested(
    AlbumsRequested event,
    Emitter<AlbumState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AlbumStatus.loading));
      final albums = await _swiftifyRepository.getAlbums();
      emit(
        state.copyWith(
          albums: albums,
          status: AlbumStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: AlbumStatus.failure));
    }
  }
}
