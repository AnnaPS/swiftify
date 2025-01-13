// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:swiftify/album/album.dart';
import 'package:swiftify_data_source/swiftify_data_source.dart';

void main() {
  group('AlbumState', () {
    group('copyWith', () {
      test('returns same object when no properties are passed', () {
        final state = AlbumState();
        expect(state.copyWith(), state);
      });

      test('initial state is not equal to updatedState', () {
        final state = AlbumState();
        final updatedState = state.copyWith(status: AlbumStatus.loading);
        expect(updatedState.status, isNot(state.status));
      });

      test('returns object with updated status when status is passed', () {
        final state = AlbumState();
        final updatedState = state.copyWith(status: AlbumStatus.loading);
        expect(updatedState.status, equals(AlbumStatus.loading));
      });

      test('returns object with updated albums when albums are passed', () {
        final state = AlbumState();
        final updatedState = state.copyWith(albums: [Album(title: 'evermore')]);
        expect(updatedState.albums, [Album(title: 'evermore')]);
      });

      test('isSuccess', () {
        final state = AlbumState(status: AlbumStatus.success);
        expect(state.isSuccess, isTrue);
      });

      test('isFailure', () {
        final state = AlbumState(status: AlbumStatus.failure);
        expect(state.isFailure, isTrue);
      });

      test('isLoading', () {
        final state = AlbumState(status: AlbumStatus.loading);
        expect(state.isLoading, isTrue);
      });
    });
  });
}
