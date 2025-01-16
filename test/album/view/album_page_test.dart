import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/album/album.dart';

import '../../helpers/helpers.dart';

class _MockAlbumBloc extends MockBloc<AlbumEvent, AlbumState>
    implements AlbumBloc {}

void main() {
  late AlbumBloc albumBloc;

  setUp(() {
    albumBloc = _MockAlbumBloc();
  });

  testWidgets('renders AlbumView', (tester) async {
    await tester.pumpApp(
      BlocProvider.value(
        value: albumBloc,
        child: const AlbumPage(),
      ),
    );

    expect(find.byType(AlbumView), findsOneWidget);
  });
}
