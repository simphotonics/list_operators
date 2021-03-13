import 'package:exception_templates/exception_templates.dart';
import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  final i1 = [1, 2, 3];
  final n1 = [1, 2.0, 3];
  final d1 = [1.0, 2.0, 3.0];
  final d2 = [11.0, 12.0, 13.0];

  final listOfDouble = <double>[].runtimeType;

  group('Numerical operators:', () {
    test('-', () {
      expect(d2 - d1, <double>[10, 10, 10]);
      expect((d2 - d1).runtimeType, listOfDouble);
      expect(d2 - i1, <double>[10, 10, 10]);
      expect((d2 - n1).runtimeType, listOfDouble);
    });

    test('Unary minus', () {
      expect(-d1, d1 * -1);
    });
    test('+', () {
      expect(d1 + d2, [...d1, ...d2]);
    });
    test('*', () {
      expect(d1 * 2, [2, 4, 6]);
    });
    test('/', () {
      expect(d1 / 2, [0.5, 1, 1.5]);
    });
    test('~/', () {
      expect(d1 ~/ 2, [0, 1, 1]);
      expect(d2 ~/ 2, [5, 6, 6]);
    });
  });
  group('Methods:', () {
    test('abs()', () {
      expect(n1.abs(), [1, 2, 3]);
      expect((-d1).abs(), d1);
    });
    test('plus()', () {
      expect(d1.plus(d2), d2.plus(d1));
      expect(d1.plus(d2), [12, 14, 16]);
    });
    test('pow()', () {
      expect(d1.pow(2), [1, 4, 9]);
    });
    test('min', () {
      expect([0.7, -0.3, 1, 55].min(), -0.3);
      expect([1, 1, 2, 2].min(), 1);
    });
    test('max', () {
      expect([7, 8, -9].max(), 8);
    });
  });
  group('Comparisons:', () {
    test('<', () {
      expect(d1 < d2, true);
    });
    test('<=', () {
      expect(d1 <= d2, true);
    });
    test('>', () {
      expect(d2 > d1, true);
    });
    test('>=', () {
      expect(d2 >= d1, true);
    });
  });

  group('Exceptions', () {
    test('IncompatibleLists', () {
      try {
        [0, 1] - [1, 3, 4];
      } on ErrorOfType<IncompatibleLists> catch (e) {
        expect(e.message, 'Error using \'-\' with List<int>.');
      }
    });
  });
}
