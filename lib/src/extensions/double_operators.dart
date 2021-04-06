import 'dart:math' as math;

import 'assertions.dart';

/// Provides operators and methods for object of type List<double>.
extension DoubleOperators on List<double> {
  /// Returns the minimum value.
  /// * The list must have at least one element.
  double min() {
    assertHasElements();
    return reduce((value, element) => math.min(value, element));
  }

  /// Returns the maximum value.
  /// * The list must have at least one element.
  double max() {
    assertHasElements();
    return reduce((value, element) => math.max(value, element));
  }

  /// Returns a new list consisting of the absolute value of
  /// the elements of `this`.
  List<double> abs() {
    return List<double>.generate(length, (i) => this[i].abs());
  }

  /// Returns a new list containing the elements of `this`
  /// multiplied by `scalar`.
  List<double> operator *(num scalar) {
    return List<double>.generate(length, (i) => this[i] * scalar);
  }

  /// Returns a new list containing the elements of `this` converted to `int`.
  List<int> toInt() {
    return List<int>.generate(length, (i) => this[i].toInt());
  }
}

extension DoubleIterableOperators on Iterable<double> {
  /// Returns the sum of the entries.
  ///
  /// The iterable must not be empty.
  num sum() {
    assertHasElements();
    return fold<num>(0.0, (sum, current) => sum + current);
  }

  /// Returns the product of the entries.
  ///
  /// The iterable must not be empty.
  double prod() {
    assertHasElements();
    return fold<double>(1.0, (prod, current) => prod * current);
  }
}
