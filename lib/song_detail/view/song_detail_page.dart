import 'package:flutter/material.dart';
import 'package:swiftify/song_detail/song_detail.dart';

class SongDetailPage extends StatelessWidget {
  const SongDetailPage({
    required this.songId,
    required this.lyrics,
    required this.songTitle,
    this.coverAlbum,
    super.key,
  });

  final int songId;
  final String lyrics;
  final String? coverAlbum;
  final String songTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songTitle),
      ),
      body: SongDetailView(
        lyrics: lyrics,
        coverAlbum: coverAlbum,
      ),
    );
  }
}
