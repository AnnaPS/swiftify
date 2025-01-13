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

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'title': instance.title,
      'album_id': instance.albumId,
      'song_id': instance.songId,
      'lyrics': instance.lyrics,
    };
