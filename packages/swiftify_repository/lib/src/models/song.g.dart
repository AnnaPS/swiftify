// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      title: json['title'] as String? ?? '',
      albumId: (json['album_id'] as num?)?.toInt() ?? 0,
      songId: (json['song_id'] as num?)?.toInt() ?? 0,
    );
