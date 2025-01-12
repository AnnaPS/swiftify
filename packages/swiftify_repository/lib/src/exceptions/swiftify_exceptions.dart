/// {@template swiftify_exceptions}
/// Base class for exceptions thrown by the Swiftify repository.
/// {@endtemplate}
abstract class SwiftifyExceptions implements Exception {
  /// {@macro swiftify_exceptions}

  const SwiftifyExceptions(this.error);

  /// The error that was caught.
  final Object? error;
}

/// {@template get_albums_exception}
/// An exception thrown when something goes wrong
/// when getting Taylor Swift's albums.
/// {@endtemplate}
class GetAlbumsException extends SwiftifyExceptions {
  /// {@macro get_albums_exception}
  const GetAlbumsException(super.error);

  @override
  String toString() => '[GetAlbumsException] $error';
}

/// {@template get_album_exception}
/// An exception thrown when something goes wrong
/// when getting a Taylor Swift songs.

/// {@endtemplate}
class GetSongsException extends SwiftifyExceptions {
  /// {@macro get_album_exception}
  const GetSongsException(super.error);

  @override
  String toString() => '[GetSongsException] $error';
}

/// {@template get_lyrics_exception}
/// An exception thrown when something goes wrong
/// when getting lyrics for a song.
/// {@endtemplate}
class GetLyricsException extends SwiftifyExceptions {
  /// {@macro get_lyrics_exception}
  const GetLyricsException(super.error);

  @override
  String toString() => '[GetLyricsException] $error';
}
