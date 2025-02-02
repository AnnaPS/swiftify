import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongBloc extends Bloc<SongEvent, SongsState> {
  SongBloc({
    required SwiftifyRepository swiftifyRepository,
  })  : _swiftifyRepository = swiftifyRepository,
        super(const SongsState()) {
    on<SongsRequested>(_onSongsByAlbumRequested);
  }

  final SwiftifyRepository _swiftifyRepository;

  Future<void> _onSongsByAlbumRequested(
    SongsRequested event,
    Emitter<SongsState> emit,
  ) async {
    emit(state.copyWith(status: SongsStatus.loading));
    try {
      final songs = await _swiftifyRepository.getSongsByAlbum(
        albumId: event.albumId,
      );
      emit(
        state.copyWith(
          songs: songs,
          status: SongsStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: SongsStatus.failure));
    }
  }
}
