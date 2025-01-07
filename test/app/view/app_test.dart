import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftify/app/app.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

class _MockSwiftifyRepository extends Mock implements SwiftifyRepository {}

void main() {
  group('App', () {
    late SwiftifyRepository swiftifyRepository;

    setUp(() {
      swiftifyRepository = _MockSwiftifyRepository();
    });

    testWidgets('renders BottomNavigationBar', (tester) async {
      await tester.pumpWidget(
        App(
          swiftifyRepository: swiftifyRepository,
        ),
      );
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });
}
