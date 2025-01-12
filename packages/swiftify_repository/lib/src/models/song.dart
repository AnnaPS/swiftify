import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

/// {@template song}
/// A class representing a song
/// {@endtemplate}
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Song extends Equatable {
  /// {@macro song}
  const Song({
    this.title = '',
    this.albumId = 0,
    this.songId = 0,
  });

  /// Create a [Song] from a JSON object
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  /// The title of the song
  final String title;

  /// The album id of the song
  final int albumId;

  /// The id of the song
  final int songId;

  @override
  List<Object?> get props => [
        title,
        albumId,
        songId,
      ];
}
