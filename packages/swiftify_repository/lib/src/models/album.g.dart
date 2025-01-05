// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      title: $enumDecodeNullable(_$AlbumTitleEnumEnumMap, json['title']) ??
          AlbumTitleEnum.taylorSwift,
      albumCover: json['albumCover'] as String? ?? '',
      artist: json['artist'] as String? ?? '',
      releaseDate: json['releaseDate'] == null
          ? const []
          : _releaseDateFromJson(json['releaseDate']),
    );

const _$AlbumTitleEnumEnumMap = {
  AlbumTitleEnum.taylorSwift: 'Taylor Swift',
  AlbumTitleEnum.lover: 'Lover',
  AlbumTitleEnum.red: 'Red',
  AlbumTitleEnum.fearless: 'Fearless',
  AlbumTitleEnum.speakNow: 'Speak Now',
  AlbumTitleEnum.nineteenEightyNine: '1989',
  AlbumTitleEnum.reputation: 'Reputation',
  AlbumTitleEnum.midnights: 'Midnights',
  AlbumTitleEnum.evermore: 'Evermore',
  AlbumTitleEnum.folklore: 'Folklore',
};
