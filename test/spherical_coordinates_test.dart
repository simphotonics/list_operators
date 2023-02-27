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
  group('Spherical -> Cartesian:', () {
    test('origin', () {
      expect(
        [0, pi, pi].sphericalToCartesian,
        closeToList([0, 0, 0], 1e-12),
      );
    });
    test('north pole', () {
      expect(
        [1, 0, 0].sphericalToCartesian,
        closeToList([0, 0, 1], 1e-12),
      );
    });
    test('south pole', () {
      expect(
        [1, pi, 0].sphericalToCartesian,
        closeToList([0, 0, -1], 1e-12),
      );
    });
    test('Equator', () {
      expect(
        [1, pi / 2, 0].sphericalToCartesian,
        closeToList([1, 0, 0], 1e-12),
      );
      expect(
        [1, pi / 2, pi / 2].sphericalToCartesian,
        closeToList([0, 1, 0], 1e-12),
      );
    });
  });
  group('Cartesian -> Spherical:', () {
    test('origin', () {
      expect(
          [0, 0, 0].cartesianToSpherical,
          HasElementAt<List<num>>(
            index: 0,
            matcher: closeTo(0, 1e-12),
          ));
      expect([0, 0, 0].cartesianToSpherical.sum(), closeTo(0, 0));
    });
    test('north pole', () {
      expect(
          [0, 0, 1].cartesianToSpherical,
          HasElementAt<List<num>>(
            index: 0,
            matcher: closeTo(1, 1e-12),
          ));
      expect(
          [0, 0, 1].cartesianToSpherical,
          HasElementAt<List<num>>(
            index: 1,
            matcher: closeTo(0, 1e-12),
          ));
    });
    test('south pole', () {
      expect(
          [0, 0, -1].cartesianToSpherical,
          HasElementAt<List<num>>(
            index: 0,
            matcher: closeTo(1, 1e-12),
          ));
      expect(
          [0, 0, -1].cartesianToSpherical,
          HasElementAt<List<num>>(
            index: 1,
            matcher: closeTo(pi, 1e-12),
          ));
    });
    test('equator', () {
      expect(
        [1, 0, 0].cartesianToSpherical,
        closeToList([1, pi / 2, 0], 1e-12),
      );
      expect([0, 1, 0].cartesianToSpherical,
          closeToList([1, pi / 2, pi / 2], 1e-12));
    });
  });
  group('Errors:', () {
    final coordinates = [
      [0, pi],
      [1, 0, pi]
    ];
    test('inner list length', () {
      expect(
        () => coordinates.cartesianToSpherical,
        throwsA(
          isA<ErrorOfType<IndexOutOfRange>>().having((e) => e.message,
              'message', 'Error in getter <cartesianToSpherical>.'),
        ),
      );
    });
    test('inner list length', () {
      expect(
        () => coordinates.sphericalToCartesian,
        throwsA(
          isA<ErrorOfType<IndexOutOfRange>>().having((e) => e.message,
              'message', 'Error in getter <sphericalToCartesian>.'),
        ),
      );
    });
  });
}
