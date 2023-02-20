import 'package:list_operators/list_operators.dart';
import 'package:test/test.dart' show test, group, expect, TestFailure;

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
  group('closeTo()', () {
    test('Iterable<int>', () {
      final i1 = [101, 102];
      final i2 = [111, 103];
      final delta = 2;
      expectToFail(i1, isCloseTo(i2, delta),
          failMessage: 'Expected: a numerical iterable differing from '
              '[111, 103] by less than <$delta>\n'
              '  Actual: [101, 102]\n'
              '   Which: at position \'0\' has value <101> which is outside'
              ' the valid range [109, 113].\n'
              '');
    });
    test('Iterable<double>', () {
      final d1 = [101, 102];
      final d2 = [104.0, 102.0];
      expect(d1, isCloseTo(d2, 4));
    });
    test('Iterable<num>', () {
      final n1 = <num>[101.0, 102.0];
      final n2 = <num>[105, 105];
      expect(n2, isCloseTo(n1, 5));
    });
    test('Empty Iterable', () {
      expect(<int>[], isCloseTo(<num>[], 5));
    });
    test('Infinity', () {
      expect([double.infinity], isCloseTo([0], double.infinity));
    });
    test('NaN', () {
      expectToFail(
        [99],
        isCloseTo([99], double.nan),
        failMessage: 'Expected: a numerical iterable differing from '
            '[99] by less than <NaN>\n'
            '  Actual: [99]\n'
            '   Which: at position \'0\' has value <99> which is outside '
            'the valid range [NaN, NaN].\n'
            '',
      );
    });
  });
}
