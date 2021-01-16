import 'dart:math';

import 'package:exception_templates/exception_templates.dart';
import 'package:list_operators/src/exceptions/incompatible_lists.dart';
import 'package:minimal_test/minimal_test.dart';

import 'package:list_operators/list_operators.dart';

void main(List<String> args) {
  group('distanceFromOrigin:', () {
    test('[]', () {
      expect(<num>[].distanceFromOrigin, 0);
    });
    test('[0, 0]', () {
      expect([0, 0].distanceFromOrigin, 0);
    });
    test('[1, 0]', () {
      expect([1, 0].distanceFromOrigin, 1);
    });
    test('[1, 1]', () {
      expect([1, 1].distanceFromOrigin, sqrt(2));
    });
  });
  group('distance', () {
    test('[].distance([])', () {
      expect(<num>[].distance([]), 0);
    });
    test('[0, 0].distance([0, 0]', () {
      expect([0, 0].distance([0, 0]), 0);
    });
    test('[1, 0].distance[0, 0]', () {
      expect([1, 0].distance([0, 0]), 1);
    });
    test('[1, 1]', () {
      expect([1, 1].distance([1, 1]), 0);
    });
    test('orthogonality', () {
      expect([1, 0].distance([0, 1]), sqrt(2));
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