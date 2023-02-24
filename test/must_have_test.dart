import 'dart:collection';

import 'package:exception_templates/exception_templates.dart';
import 'package:list_operators/list_operators.dart';
import 'package:test/test.dart';

void main() {
  group('mustHaveSameLength', () {
    final a = <int>[0, 1];
    final b = Queue.of(<num>[2.0, 3, 4]);
    test('throws', () {
      expect(
        () => a.mustHaveSameLength(b),
        throwsA(isA<ErrorOfType<LengthMismatch>>()),
      );
    });
    test('error message', () {
      try {
        a.mustHaveSameLength(b, operatorSymbol: '-');
      } catch (e) {
        expect(e, isA<ErrorOfType<LengthMismatch>>());
        expect((e as ErrorOfType).invalidState,
            'Length of $a does not match length of $b.');
      }
    });
  });

  group('Minimum Length:', () {
    final q = Queue.of(<num>[2.0, 5, 6, 7, 8]);
    test('Iterable', () {
      try {
        q.mustHaveMinLength(10);
      } catch (e) {
        expect(e, isA<ErrorOfType<LengthMismatch>>());
        expect((e as ErrorOfType).invalidState,
            '$q has only ${q.length} elements.');
      }
    });
    test('Iterable checking n.', () {
      expect(
        () {
          q.mustHaveMinLength(5);
          throw ('Call above must not throw!');
        },
        throwsA(isA<String>()),
      );
    });

    test('List', () {
      final a = <int>[0, 1];
      final b = <num>[2.0, 3, 4];
      try {
        a.mustHaveSameLength(b, operatorSymbol: '-');
      } catch (e) {
        expect(e, isA<ErrorOfType<LengthMismatch>>());
        expect((e as ErrorOfType).invalidState,
            'Length of $a does not match length of $b.');
      }
    });
  });
}
