import 'dart:math';

import 'package:exception_templates/exception_templates.dart';
import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  final i1 = [1, 2, 3];
  final n1 = [1, 2.0, 3];
  final n2 = [11, 12.0, 13];
  final d1 = [1.0, 2.0, 3.0];

  group('Minus:', () {
    test('List<num> - List<num> ', () {
      expect(n2 - n1, <num>[10, 10, 10]);
    });
    test('(List<num> - List<num>)', () {
      expect((n2 - n1), isA<List<num>>());
    });
    test('List<num> - List<int>', () {
      expect(n2 - i1, <num>[10, 10, 10]);
    });
    test('(List<num> - List<int>)', () {
      expect((n2 - i1), isA<List<num>>());
    });
    test('(List<num> - List<double>)', () {
      expect((n2 - d1), isA<List<double>>());
    });
  });

  group('Plus:', () {
    test('List<num>.plus(List<num>)', () {
      expect(n2.plus(n1), <num>[12, 14, 16]);
    });
    test('List<num>.plus(List<num>)', () {
      expect(n2.plus(n1), isA<List<num>>());
    });
    test('List<num>plus(List<int>)', () {
      expect(n2.plus(i1), <num>[12, 14, 16]);
    });
    test('(num + int)', () {
      expect(n2.plus(i1), isA<List<num>>());
    });
    test('List<num>.plus(List<double>)', () {
      expect(n2.plus(d1), isA<List<double>>());
    });
  });

  group('Inner Product:', () {
    test('(List<num>, List<num>) value ', () {
      expect(n2.innerProd(n1), 74);
    });
    test('(List<num>, List<num>) runtimeType', () {
      expect(n2.innerProd(n1), isA<double>());
    });
    test('(List<int>, List<int>)', () {
      expect(i1.innerProd(i1), isA<int>());
    });
    test('(List<num>, List<int>) value', () {
      expect(n2.innerProd(i1), 74);
    });
    test('(List<num>, List<int>) runtimeType', () {
      expect(n2.innerProd(i1), isA<double>());
    });
    test('(List<n2>, List<d1>) runtimeType', () {
      expect(n2.innerProd(d1), isA<double>());
    });
  });

  group('Scalar multiplication:', () {
    test('(num, int) value', () {
      expect(n1 * 2, [2, 4, 6]);
    });
    test('(num, int) type', () {
      expect((n1 * 2), isA<List<num>>());
    });

    test('(int, int) value', () {
      expect(i1 * 2, [2, 4, 6]);
    });
    test('(int, int) type', () {
      expect((i1 * 2), isA<List<int>>());
    });

    test('(double, int) value', () {
      expect(d1 * 2, [2, 4, 6]);
    });
    test('(double, int) type', () {
      expect((d1 * 2), isA<List<double>>());
    });
  });

  group('Unary Minus:', () {
    test('value of -int', () {
      expect(-i1, i1 * -1);
    });
    test('type of -int', () {
      expect((-i1), isA<List<int>>());
    });
    test('value of -num', () {
      expect(-n1, n1 * -1);
    });
    test('type of -num', () {
      expect((-n1), isA<List<num>>());
    });
    test('value of -double', () {
      expect(-d1, d1 * -1);
    });
    test('type of -double', () {
      expect((-d1), isA<List<double>>());
    });
  });

  group('Division', () {
    test('value', () {
      expect(i1 / 2, [0.5, 1, 1.5]);
      expect(i1 / 2, [0.5, 1, 1.5]);
    });
    test('type', () {
      expect((i1 / 2), isA<List<double>>());
    });
  });

  group('Integer division', () {
    test('(int, int) value', () {
      expect(i1 ~/ 2, [0, 1, 1]);
    });
    test('(num, int) value', () {
      expect(n2 ~/ 2, [5, 6, 6]);
    });
  });

  group('Absolute Value', () {
    test('List<num> value', () {
      expect(n1.abs(), [1, 2, 3]);
      expect((-n1).abs(), n1);
    });

    test('List<num> type', () {
      expect(n1.abs(), isA<List<num>>());
    });
    test('List<int> value', () {
      expect(i1.abs(), [1, 2, 3]);
      expect((-i1).abs(), i1);
    });

    test('List<int> type', () {
      expect(i1.abs(), isA<List<int>>());
    });
    test('List<double> value', () {
      expect(d1.abs(), [1, 2, 3]);
      expect((-d1).abs(), d1);
    });

    test('List<double> type', () {
      expect(d1.abs(), isA<List<double>>());
    });
  });

  group('Power', () {
    test('List<num> value', () {
      expect(n1.pow(2), [1, 4, 9]);
    });
    test('List<int> value', () {
      expect(i1.pow(2), [1, 4, 9]);
    });
    test('List<double> value', () {
      expect(d1.pow(2), [1, 4, 9]);
    });
    test('List<num> type', () {
      expect(n1.pow(2), isA<List<num>>());
    });
    test('List<int> type', () {
      expect(i1.pow(2), isA<List<int>>());
    });
    test('List<double> type', () {
      expect(d1.pow(2), isA<List<double>>());
    });
  });
  group('exp()', () {
    test('List<num> value', () {
      expect(n1.exp(), [exp(n1[0]), exp(n1[1]), exp(n1[2])]);
    });
    test('List<int> value', () {
      expect(i1.exp(2), [exp(i1[0] * 2), exp(i1[1] * 2), exp(i1[2] * 2)]);
    });
    test('List<double> value', () {
      expect(d1.exp(2), [exp(d1[0] * 2), exp(d1[1] * 2), exp(d1[2] * 2)]);
    });
    test('List<num> type', () {
      expect(n1.exp(2), isA<List<double>>());
    });
    test('List<int> type', () {
      expect(i1.exp(2), isA<List<double>>());
    });
    test('List<double> type', () {
      expect(d1.exp(2), isA<List<double>>());
    });
  });
  group('Methods:', () {
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
    test('sum()', () {
      expect([1, 2, 3].sum(), 6);
    });
    test('prod()', () {
      expect([1, 2, 3, 4].prod(), 24);
      expect(<num>[1, 2, 3, 4].prod(), isA<int>());
      expect(<num>[1, 2, 3, 4.0].prod(), isA<double>());
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
    test('match self', () {
      expect(n1.equalWithinPrecision(n1 * 1), true);
    });
    test('n1 != n2', () {
      expect(n1.equalWithinPrecision(n2), false);
    });
  });

  group('Exceptions', () {
    test('ListLengthMismatch', () {
      try {
        [0, 1].distance([1, 3, 4]);
      } on ErrorOfType<ListLengthMismatch> catch (e) {
        expect(e.message,
            'Can\'t calculate distance between [0, 1] and [1, 3, 4].');
      }
    });
  });
}
