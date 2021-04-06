import 'dart:math' as math;

import 'assertions.dart';

/// Provides additional operators and methods for objects of type List<int>.
extension IntOperators on List<int> {
  /// Returns a new list consisting of the absolute value of
  /// the elements of `this`.
  List<int> abs() {
    return List<int>.generate(length, (i) => this[i].abs());
  }

  /// Returns a new list containing the elements of `this`
  /// multiplied by `scalar`.
  List<int> operator *(int scalar) {
    return List<int>.generate(length, (i) => this[i] * scalar);
  }

  /// Returns a new list containing the elements of `this` converted to `double`.
  List<double> toDouble() {
    return List<double>.generate(length, (i) => this[i].toDouble());
  }
}

extension IntIterableOperators on Iterable<int> {
  /// Returns the minimum value.
  /// * The list must have at least one element.
  int min() {
    assertHasElements();
    return reduce((value, element) => math.min(value, element));
  }

  /// Returns the maximum value.
  /// * The list must have at least one element.
  int max() {
    assertHasElements();
    return reduce((value, element) => math.max(value, element));
  }

  /// Returns the sum of the entries.
  ///
  /// The iterable must not be empty.
  int sum() {
    assertHasElements();
    return fold<int>(0, (sum, current) => sum + current);
  }

  /// Returns the product of the entries.
  ///
  /// The iterable must not be empty.
  int prod() {
    assertHasElements();
    return fold<int>(1, (prod, current) => prod * current);
  }
}
