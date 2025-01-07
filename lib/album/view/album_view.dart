import 'package:flutter/material.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Page'),
      ),
      body: const Center(
        child: Text('Album Page'),
      ),
    );
  }
}
