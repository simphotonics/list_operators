import 'dart:collection';

import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  final i1 = [1, 2, 3];
  final i2 = [i1];
  final u1 = UnmodifiableListView(i1);
  final u2 = UnmodifiableListView([u1]);

  group('Unmodifiable:', () {
    test('value', () {
      expect(i1.unmodifiable, i1);
    });
    test('type', () {
      expect(i1.unmodifiable.runtimeType, u1.runtimeType);
    });
  });

  group('RecursiveUnmodifiable:', () {
    test('value', () {
      expect(i2.unmodifiable, i2);
    });
    test('type', () {
      expect(i2.unmodifiable.runtimeType, u2.runtimeType);
    });
  });

  group('Errors', () {
    test('Adding elements to list', () {
      try {
        u1.add(999);
      } catch (e) {
        expect(e.runtimeType, UnsupportedError);
      }
    });
    test('Adding elements to inner list', () {
      try {
        u2.first.add(999);
      } catch (e) {
        expect(e.runtimeType, UnsupportedError);
      }
    });
  });
}
