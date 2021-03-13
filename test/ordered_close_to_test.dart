import 'package:list_operators/list_operators.dart';
import 'package:test/test.dart';

void expectToFail(
  dynamic actual,
  dynamic matcher, {
  String failMessage = '',
}) {
  try {
    expect(actual, matcher);
  } on TestFailure catch (exception) {
    expect(failMessage, exception.message);
  }
}

void main() {
  group('orderedCloseTo()', () {
    test('Iterable<int>', () {
      final i1 = [101, 102];
      final i2 = [111, 103];
      expectToFail(i1, orderedCloseTo(i2, [2, 2]),
          failMessage: 'Expected: a numerical iterable differing from '
              '[111, 103] by less than [2, 2]\n'
              '  Actual: [101, 102]\n'
              '   Which: at position \'0\' has value 101 and is outside the valid range [109, 113]\n'
              '');
    });
    test('Iterable<double>', () {
      final d1 = [101, 102];
      final d2 = [104.0, 102.0];
      expect(d1, orderedCloseTo(d2, [-4, 4]));
    });
    test('Iterable<num>', () {
      final n1 = <num>[101.0, 102.0];
      final n2 = <num>[105, 105];
      expect(n2, orderedCloseTo(n1, [5.0, 5.0]));
    });
    test('Empty Iterable', () {
      expect(<int>[], orderedCloseTo(<num>[], []));
    });
    test('Infinity', () {
      expect([double.infinity], orderedCloseTo([0], [double.infinity]));
    });
    test('NaN', () {
      expectToFail(
        [99],
        orderedCloseTo([99], [double.nan]),
        failMessage: 'Expected: a numerical iterable differing from '
            '[99] by less than [NaN]\n'
            '  Actual: [99]\n'
            '   Which: at position \'0\' has value 99 and is outside '
            'the valid range [NaN, NaN]\n'
            '',
      );
    });
  });
}
