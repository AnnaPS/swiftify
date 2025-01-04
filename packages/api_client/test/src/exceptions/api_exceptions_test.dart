// ignore_for_file: prefer_const_constructors

import 'package:api_client/src/exceptions/api_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkException', () {
    test('can be instantiated.', () {
      expect(
        NetworkException(Exception()),
        isNotNull,
      );
    });

    test('custom toString is correct.', () {
      final exception = Exception();
      expect(
        NetworkException(exception).toString(),
        equals('[NetworkException] $exception'),
      );
    });
  });

  group('BadRequestException', () {
    test('can be instantiated.', () {
      expect(
        BadRequestException(Exception()),
        isNotNull,
      );
    });

    test('custom toString is correct.', () {
      final exception = Exception();
      expect(
        BadRequestException(exception).toString(),
        equals('[BadRequestException] $exception'),
      );
    });
  });

  group('UnauthorizedException', () {
    test('can be instantiated.', () {
      expect(
        UnauthorizedException(Exception()),
        isNotNull,
      );
    });

    test('custom toString is correct.', () {
      final exception = Exception();
      expect(
        UnauthorizedException(exception).toString(),
        equals('[UnauthorizedException] $exception'),
      );
    });
  });

  group('ForbiddenException', () {
    test('can be instantiated.', () {
      expect(
        ForbiddenException(Exception()),
        isNotNull,
      );
    });

    test('custom toString is correct.', () {
      final exception = Exception();
      expect(
        ForbiddenException(exception).toString(),
        equals('[ForbiddenException] $exception'),
      );
    });
  });

  group('DeserializationException', () {
    test('can be instantiated.', () {
      expect(
        DeserializationException(Exception()),
        isNotNull,
      );
    });

    test('emptyResponseBody can be instantiated', () {
      expect(
        DeserializationException.emptyResponseBody(),
        isNotNull,
      );
    });

    test('custom toString is correct.', () {
      final exception = Exception();
      expect(
        DeserializationException(exception).toString(),
        equals('[DeserializationException] $exception'),
      );
    });
  });
}
