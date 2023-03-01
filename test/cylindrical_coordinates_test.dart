import 'dart:math';

import 'package:exception_templates/exception_templates.dart';
import 'package:list_operators/list_operators.dart';
import 'package:test/test.dart';

class HasElementAt<T extends Iterable> extends CustomMatcher {
  HasElementAt({required this.index, matcher})
      : super('Iterable with element at index $index:', 'at $index', matcher);

  final int index;
  @override
  featureValueOf(actual) => (actual as T).elementAt(index);
}

void main() {
  group('Cylindrical -> Cartesian:', () {
    test('origin', () {
      expect(
        [0, 0, 0].cylindricalToCartesian,
        [0, 0, 0],
      );
    });
    test('z-axis positive ', () {
      expect(
        [0, 0, 1].cylindricalToCartesian,
        [0, 0, 1],
      );
    });
    test('z-axis negative', () {
      expect(
        [0, 0, -1].cylindricalToCartesian,
        [0, 0, -1],
      );
    });
    test('x-y plane', () {
      expect([1, 0, 0].cylindricalToCartesian, [1, 0, 0]);
      expect(
        [1, pi / 2, 0].cylindricalToCartesian,
        closeToList([0, 1, 0], 1e-12),
      );
    });
  });
  group('Cartesian -> Cylindrical:', () {
    final sqrt2 = sqrt(2);
    test('origin', () {
      expect(
        [0, 0, 0].cartesianToCylindrical,
        [0, 0, 0],
      );
    });
    test('z-axis positive', () {
      expect(
        [0, 0, 1].cartesianToCylindrical,
        [0, 0, 1],
      );
    });
    test('z-axis negative', () {
      expect(
        [0, 0, -1].cartesianToCylindrical,
        [0, 0, -1],
      );
    });
    test('x-y plane [0, 0, 1]', () {
      expect(
        [1, 0, 0].cartesianToCylindrical,
        closeToList([1, 0, 0], 1e-12),
      );
    });
    test('x-y plane [0, 1, 0]', () {
      expect(
          [0, 1, 0].cartesianToCylindrical, closeToList([1, pi / 2, 0], 1e-12));
    });
    test('x-y plane [1, 1, 0]', () {
      expect([1, 1, 0].cartesianToCylindrical,
          closeToList([sqrt2, pi / 4, 0], 1e-12));
    });
    test('x-y plane [-1, 1, 0]', () {
      expect([-1, 1, 0].cartesianToCylindrical,
          closeToList([sqrt2, 3 * pi / 4, 0], 1e-12));
    });
    test('x-y plane [-1, -1, 0]', () {
      expect([-1, -1, 0].cartesianToCylindrical,
          closeToList([sqrt2, 5 * pi / 4, 0], 1e-12));
    });
    test('x-y plane [1, -1, 0]', () {
      expect([1, -1, 0].cartesianToCylindrical,
          closeToList([sqrt2, 7 * pi / 4, 0], 1e-12));
    });
  });

  group('Random entries', () {
    final rand = Random();
    final v = [rand.nextDouble(), rand.nextDouble(), rand.nextDouble()];
    test('cart -> cyl -> cart', () {
      expect(v.cartesianToCylindrical.cylindricalToCartesian,
          closeToList(v, 1e-12));
    });
    test('cyl -> cart -> cyl', () {
      expect(v.cylindricalToCartesian.cartesianToCylindrical,
          closeToList(v, 1e-12));
    });
  });
  group('Errors:', () {
    final coordinates = [
      [0, pi],
      [1, pi, 1]
    ];
    test('inner list length', () {
      expect(
        () => coordinates.cartesianToCylindrical,
        throwsA(
          isA<ErrorOfType<IndexOutOfRange>>().having((e) => e.message,
              'message', 'Error in getter <cartesianToCylindrical>.'),
        ),
      );
    });
    test('inner list length', () {
      expect(
        () => coordinates.cylindricalToCartesian,
        throwsA(
          isA<ErrorOfType<IndexOutOfRange>>().having((e) => e.message,
              'message', 'Error in getter <cylindricalToCartesian>.'),
        ),
      );
    });
  });
}
