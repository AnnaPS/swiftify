import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(
        swiftifyRepository: context.read<SwiftifyRepository>(),
      )..add(AlbumsRequested()),
      child: const AlbumView(),
    );
  }
}
