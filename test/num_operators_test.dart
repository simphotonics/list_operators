import 'package:exception_templates/exception_templates.dart';
import 'package:minimal_test/minimal_test.dart';

import 'package:list_operators/src/exceptions/incompatible_lists.dart';
import 'package:list_operators/list_operators.dart';

void main(List<String> args) {
  final i1 = [1, 2, 3];
  final n1 = [1, 2.0, 3];
  final n2 = [11, 12.0, 13];
  final d1 = [1.0, 2.0, 3.0];

  final listOfNum = <num>[].runtimeType;

  group('Numerical operators:', () {
    test('-', () {
      expect(n2 - n1, <num>[10, 10, 10]);
      expect((n2 - n1).runtimeType, listOfNum);
      expect(n2 - i1, <num>[10, 10, 10]);
      expect((n2 - d1).runtimeType, listOfNum);
    });

    test('Unary minus', () {
      expect(-i1, i1 * -1);
    });
    test('+', () {
      expect(n1 + n2, [...n1, ...n2]);
    });
    test('*', () {
      expect(n1 * 2, [2, 4, 6]);
    });
    test('/', () {
      expect(i1 / 2, [0.5, 1, 1.5]);
    });
    test('~/', () {
      expect(i1 ~/ 2, [0, 1, 1]);
      expect(n2 ~/ 2, [5, 6, 6]);
    });
  });
  group('Methods:', () {
    test('abs()', () {
      expect(n1.abs(), [1, 2, 3]);
      expect((-n1).abs(), n1);
    });
    test('plus()', () {
      expect(n1.plus(n2), n2.plus(n1));
      expect(n1.plus(n2), [12, 14, 16]);
    });
    test('pow()', () {
      expect(n1.pow(2), [1, 4, 9]);
    });
    test('min()', () {
      expect([0.7, -0.3, 1, 55].min(), -0.3);
      expect([1, 1, 2, 2].min(), 1);
    });
    test('max()', () {
      expect([7, 8, -9].max(), 8);
    });
    test('mean()', () {
      expect([1, 2, 3].mean(), 2);
      expect([3.0, 3.0, 3.0].mean(), 3.0);
    });
    test('stdDev()', () {
      expect([1, 2, 3].stdDev(), 1.0);
      expect([-1, 0, 1].stdDev(), 1.0);
    });
  });
  group('Comparisons:', () {
    test('<', () {
      expect(n1 < n2, true);
    });
    test('<=', () {
      expect(n1 <= n2, true);
    });
    test('>', () {
      expect(n2 > n1, true);
    });
    test('>=', () {
      expect(n2 >= n1, true);
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
