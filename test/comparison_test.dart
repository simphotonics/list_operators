import 'package:test/test.dart';

import 'package:list_operators/list_operators.dart';

void main() {
  group('Comparison', () {
    test('operator <', () {
      expect(['a1', 'a2'] < ['b1', 'b2'], true);
      expect(['a1', 'a2'] < ['a1', 'b2'], false);
    });
    test('operator >', () {
      expect(['a1', 'a2'] > ['b1', 'b2'], false);
      expect(['c1', 'c2'] > ['a1', 'b2'], true);
    });
    test('operator <=', () {
      expect(['a1', 'a2'] <= ['b1', 'b2'], true);
      expect(['a1', 'a2'] <= ['a1', 'b2'], true);
      expect(['a1', 'a2'] <= ['a1', 'a2'], true);
      expect(['b1', 'a2'] <= ['a1', 'a2'], false);
    });
    test('operator >=', () {
      expect(['a1', 'a2'] >= ['b1', 'b2'], false);
      expect(['a1', 'a2'] >= ['a1', 'a2'], true);
      expect(['b1', 'a2'] >= ['a1', 'a2'], true);
      expect(['b1', 'b2'] >= ['a1', 'a2'], true);
    });
  });
}
