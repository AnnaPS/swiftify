// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      albumId: (json['album_id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      artistId: (json['artist_id'] as num?)?.toInt() ?? 1,
      releaseDate: json['release_date'] as String? ?? '',
    );
