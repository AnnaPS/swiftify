import 'package:flutter/material.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView({
    required this.lyrics,
    this.coverAlbum,
    super.key,
  });

  final String? coverAlbum;
  final String? lyrics;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(lyrics ?? 'No lyrics found'),
      ),
    );
  }
}
