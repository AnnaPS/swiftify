// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

/// {@template album}
/// A class representing an album
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake)
class Album extends Equatable {
  /// {@macro album}
  const Album({
    this.albumId = 0,
    this.title = '',
    this.albumCover = '',
    this.artistId = 1,
    this.releaseDate = '',
  });

  /// Converts a [Map<String, dynamic>] to an [Album] object.
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  /// Converts an [Album] object to a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  /// The album id

  final int albumId;

  /// The album title
  final String title;

  /// The album cover image in URL format
  @JsonKey(includeFromJson: false)
  final String albumCover;

  /// The artist id of the album
  final int artistId;

  final String releaseDate;

  @override
  List<Object?> get props => [
        title,
        albumCover,
        artistId,
        releaseDate,
      ];
}
