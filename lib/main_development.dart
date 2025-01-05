import 'package:swiftify/app/app.dart';
import 'package:swiftify/bootstrap.dart';
import 'package:swiftify_repository/swiftify_repository.dart';

void main() {
  bootstrap(() {
    final swiftifyRepository = SwiftifyRepository();

    return App(
      swiftifyRepository: swiftifyRepository,
    );
  });
}
