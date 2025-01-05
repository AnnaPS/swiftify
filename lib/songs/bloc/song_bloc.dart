import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc({
    required SwiftifyRepository swiftifyRepository,
  })  : _swiftifyRepository = swiftifyRepository,
        super(const SongState()) {
    on<SongsByAlbumRequested>(_onSongsByAlbumRequested);
  }

  final SwiftifyRepository _swiftifyRepository;

  Future<void> _onSongsByAlbumRequested(
    SongsByAlbumRequested event,
    Emitter<SongState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SongStatus.loading));
      final songs = await _swiftifyRepository.getSongsByAlbum(
        albumTitle: event.albumTitle,
      );
      emit(
        state.copyWith(
          songs: songs,
          status: SongStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: SongStatus.failure));
    }
  }
}
