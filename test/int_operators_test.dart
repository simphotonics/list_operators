import 'package:exception_templates/exception_templates.dart';
import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  final i1 = [1, 2, 3];
  final i2 = [11, 12, 13];
  final n1 = [1, 2.0, 3];
  final d1 = [1.0, 2.0, 3.0];

  group('Numerical operators:', () {
    test('-', () {
      expect(i2 - i1, <int>[10, 10, 10]);
      expect((i2 - i1), isA<List<int>>());
      expect(i2 - n1.toListOfInt(), <int>[10, 10, 10]);
      expect(i2 - d1.toListOfInt(), isA<List<int>>());
    });

    test('Unary minus', () {
      expect(-i1, i1 * -1);
    });
    test('+', () {
      expect(i1 + i2, [...i1, ...i2]);
    });
    test('*', () {
      expect(i1 * 2, [2, 4, 6]);
    });
    test('/', () {
      expect(i1 / 2, [0.5, 1, 1.5]);
    });
    test('~/', () {
      expect(i1 ~/ 2, [0, 1, 1]);
      expect(i2 ~/ 2, [5, 6, 6]);
    });
  });
  group('Methods:', () {
    test('abs()', () {
      expect(n1.abs(), [1, 2, 3]);
      expect((-i1).abs(), i1);
    });
    test('plus()', () {
      expect(i1.plus(i2), i2.plus(i1));
      expect(i1.plus(i2), isA<List<int>>());
      expect(i1.plus(i2), [12, 14, 16]);
    });
    test('pow()', () {
      expect(i1.pow(2), [1, 4, 9]);
    });
    test('min()', () {
      expect([0.7, -0.3, 1, 55].min(), -0.3);
      expect([1, 1, 2, 2].min(), 1);
    });
    test('max()', () {
      expect([7, 8, -9].max(), 8);
    });
    test('prod()', () {
      expect([1, 2, 3, 4].prod(), isA<int>());
    });
    test('innerProd()', () {
      expect([1, 2, 3, 4].innerProd([1, 1, 1, 1]), 10);
      expect([1, 2, 3, 4].innerProd([1, 1, 1, 1]), isA<int>());
    });
  });
  group('Comparisons:', () {
    test('<', () {
      expect(i1 < i2, true);
    });
    test('<=', () {
      expect(i1 <= i2, true);
    });
    test('>', () {
      expect(i2 > i1, true);
    });
    test('>=', () {
      expect(i2 >= i1, true);
    });
    test('match self', () {
      expect(i1.equal(i1 * 1), true);
    });
    test('i1 != i2', () {
      expect(i1.equal(i2), false);
    });
  });

  group('Exceptions', () {
    test('ListLengthMismatch', () {
      try {
        [0, 1] - [1, 3, 4];
      } on ErrorOfType<LengthMismatch> catch (e) {
        expect(e.message, 'Error using \'-\' with List<int>.');
      }
    });
  });
}
