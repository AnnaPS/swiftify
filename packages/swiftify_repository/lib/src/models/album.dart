// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

/// Enum representing the title of the album
enum AlbumTitleEnum {
  /// Taylor Swift album
  @JsonValue('Taylor Swift')
  taylorSwift('Taylor Swift'),

  /// Lover album
  @JsonValue('Lover')
  lover('Lover'),

  /// Red (Taylor's version) album
  @JsonValue('Red')
  red('Red'),

  /// Fearless (Taylor's version) album
  @JsonValue('Fearless')
  fearless('Fearless'),

  /// Speak Now (Taylor's version) album
  @JsonValue('Speak Now')
  speakNow('Speak Now'),

  /// Fearless (Taylor's Version) album
  @JsonValue('1989')
  nineteenEightyNine('1989'),

  /// Reputation album
  @JsonValue('Reputation')
  reputation('Reputation'),

  /// Midnights album
  @JsonValue('Midnights')
  midnights('Midnights'),

  /// Evermore album
  @JsonValue('Evermore')
  evermore('Evermore'),

  /// Folklore album
  @JsonValue('Folklore')
  folklore('Folklore'),
  ;

  const AlbumTitleEnum(
    this.value,
  );

  final String value;
}

/// {@template album}
/// A class representing an album
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Album extends Equatable {
  /// {@macro album}
  const Album({
    this.title = AlbumTitleEnum.taylorSwift,
    this.albumCover = '',
    this.artist = '',
    this.releaseDate = const [],
  });

  /// Converts a [Map<String, dynamic>] to an [Album] object.
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  /// The album title
  final AlbumTitleEnum title;

  /// The album cover image in URL format
  final String albumCover;

  /// The artist of the album
  final String artist;

  /// The release dates of the album
  @JsonKey(fromJson: _releaseDateFromJson)
  final List<ReleaseDate> releaseDate;

  @override
  List<Object?> get props => [
        title,
        albumCover,
        artist,
        releaseDate,
      ];
}

/// Method to convert JSON to ReleaseDate object manually.
/// The API returns the release date as a dynamic list
/// (for example: ["Oct", 1, 2024]).
List<ReleaseDate> _releaseDateFromJson(dynamic json) {
  if (json is List) {
    return [
      ReleaseDate(
        month: json[0] as String,
        day: json[1] as int,
        year: json[2] as int,
      ),
    ];
  }
  throw const FormatException('Invalid JSON format for ReleaseDate');
}

/// {@template release_date}
/// A class representing a release date
/// {@endtemplate}
class ReleaseDate extends Equatable {
  /// {@macro release_date}
  const ReleaseDate({
    required this.month,
    required this.day,
    required this.year,
  });

  /// The month of the release date
  final String month;

  /// The day of the release date
  final int day;

  /// The year of the release date
  final int year;

  @override
  List<Object?> get props => [month, day, year];

  @override
  String toString() => '$month $day, $year';
}
