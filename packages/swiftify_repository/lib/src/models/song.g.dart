// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      name: json['name'] as String? ?? '',
      artist: json['artist'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      lyrics: json['lyrics'] as String? ?? '',
      album: $enumDecodeNullable(_$AlbumTitleEnumEnumMap, json['album']) ??
          AlbumTitleEnum.taylorSwift,
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
