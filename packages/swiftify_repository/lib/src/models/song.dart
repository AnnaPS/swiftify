import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

part 'song.g.dart';

/// {@template song}
/// A class representing a song
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Song extends Equatable {
  /// {@macro song}
  const Song({
    this.name = '',
    this.artist = '',
    this.duration = '',
    this.lyrics = '',
    this.album = AlbumTitleEnum.taylorSwift,
  });

  /// Create a [Song] from a JSON object
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  /// The name of the song
  final String name;

  /// The artist of the song
  final String artist;

  /// The duration of the song
  final String duration;

  /// The lyrics of the song
  final String lyrics;

  /// The album of the song
  final AlbumTitleEnum album;

  @override
  List<Object?> get props => [
        name,
        artist,
        duration,
        lyrics,
        album,
      ];
}
