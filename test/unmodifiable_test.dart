import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  final list = [1, 2, 3];
  final nestedList = [list];
  final unmodifiableList = List<int>.unmodifiable(list);
  final unmodifiableNestedList = List<List<int>>.unmodifiable([
    unmodifiableList,
  ]);

  group('Unmodifiable:', () {
    test('value', () {
      expect(list.unmodifiable, list);
    });
    test('type', () {
      expect(list.unmodifiable.runtimeType, unmodifiableList.runtimeType);
    });
  });

  group('RecursiveUnmodifiable:', () {
    test('value', () {
      expect(nestedList.unmodifiable, unmodifiableNestedList);
    });
    test('type', () {
      expect(
        nestedList.unmodifiable.runtimeType,
        unmodifiableNestedList.runtimeType,
      );
    });
  });

  group('Errors', () {
    test('Adding elements to list', () {
      try {
        unmodifiableList.add(999);
      } catch (e) {
        expect(e.runtimeType, UnsupportedError);
      }
    });
    test('Adding elements to inner list', () {
      try {
        unmodifiableNestedList.first.add(999);
      } catch (e) {
        expect(e.runtimeType, UnsupportedError);
      }
    });
  });
}
