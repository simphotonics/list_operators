import 'package:exception_templates/exception_templates.dart';
import 'package:minimal_test/minimal_test.dart';

import 'package:list_operators/src/exceptions/incompatible_lists.dart';
import 'package:list_operators/list_operators.dart';


void main(List<String> args) {
  final a = [1, 2, 3];
  final b = [11, 12, 13];

  group('Numerical operators:', () {
    test('-', () {
      expect(b - a, [10, 10, 10]);
    });
    test('+', () {
      expect(a + b, [...a, ...b]);
    });
    test('*', () {
      expect(a * b, 74);
    });
    test('/', () {
      expect(a / 2, [0.5, 1, 1.5]);
    });
    test('~/', () {
      expect(a ~/ 2, [0, 1, 1]);
      expect(b ~/ 2, [5, 6, 6]);
    });
  });
  group('Methods:', () {
    test('plus()', () {
      expect(a.plus(b), b.plus(a));
      expect(a.plus(b), [12, 14, 16]);
    });
    test('pow()', () {
      expect(a.pow(2), [1, 4, 9]);
    });
    test('times()', () {
      expect(b.times(2), [22, 24, 26]);
      expect(a.times(0), [0, 0, 0]);
    });
  });
  group('Comparisons:', () {
    test('<', () {
      expect(a < b, true);
    });
    test('<=', () {
      expect(a <= b, true);
    });
    test('>', () {
      expect(b > a, true);
    });
    test('>=', () {
      expect(b >= a, true);
    });
  });

  group('Exceptions', () {
    test('IncompatibleLists', () {
      try {
        [0, 1].distance([1, 3, 4]);
      } on ErrorOfType<IncompatibleLists> catch (e) {
        expect(e.message,
            'Can\'t calculate distance between [0, 1] and [1, 3, 4].');
      }
    });
  });
}
