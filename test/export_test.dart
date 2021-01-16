import 'dart:math';

import 'package:minimal_test/minimal_test.dart';

import 'package:list_operators/list_operators.dart';

void main(List<String> args) {
  final a = [pi, 2.0 * pi, 3.0 * pi];
  final b = [a, a / pi, a / (0.5 * pi)];

  group('List<List<num>>:', () {
    test('export(precision:6)', () {
      expect(
          b.export(precision: 6),
          '3.14159 6.28319 9.42478 \n'
          '1.00000 2.00000 3.00000 \n'
          '2.00000 4.00000 6.00000 \n'
          '');
    });
    test('export(precision: 6, label: \'pi   2*pi   3*pi\')', () {
      expect(
          b.export(precision: 6, label: 'pi   2*pi   3*pi'),
          'pi   2*pi   3*pi\n'
          '3.14159 6.28319 9.42478 \n'
          '1.00000 2.00000 3.00000 \n'
          '2.00000 4.00000 6.00000 \n'
          '');
    });
    test('export(flipped: true, precision: 3)', () {
      expect(
          b.export(flip: true, precision: 3),
          '3.14 1.00 2.00 \n'
          '6.28 2.00 4.00 \n'
          '9.42 3.00 6.00 \n'
          '');
    });

    test('Mismatched inner lists', () {
      final a1 = [10 * pi, 20 * pi];
      expect(
          [a, a1].export(flip: true),
          'Could not export List<List<num>> with option <flipped>.\n'
          'All sub-lists must have the same length!\n'
          '');
      expect(
          [a, a1].export(),
          '3.1415926535897931160 6.2831853071795862320 9.4247779607693793480 \n'
          '31.415926535897931160 62.831853071795862320 \n'
          '');
    });
  });

  group('List<num>:', () {
    test('export(precision: 4)', () {
      expect(
          a.export(precision: 4),
          '3.142 \n'
          '6.283 \n'
          '9.425 \n'
          '');
    });
    test('export with label', () {
      expect(
          a.export(precision: 4, label: 'Multiples of pi'),
          'Multiples of pi\n'
          '3.142 \n'
          '6.283 \n'
          '9.425 \n'
          '');
    });
  });
}
