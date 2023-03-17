import 'dart:math' as math;

import 'must_have.dart';

extension DoubleOperators on List<double> {
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
}

extension DoubleIterableMethods on Iterable<double> {
  /// Returns the sum of the entries.
  ///
  /// The iterable must not be empty.
  double sum() {
    mustHaveElements();
    return fold<double>(0.0, (sum, current) => sum + current);
  }

  /// Returns the minimum value.
  /// * The list must have at least one element.
  double min() {
    mustHaveElements();
    return reduce((value, element) => math.min(value, element));
  }

  /// Returns the maximum value.
  /// * The list must have at least one element.
  double max() {
    mustHaveElements();
    return reduce((value, element) => math.max(value, element));
  }

  /// Returns the product of the entries.
  ///
  /// The iterable must not be empty.
  double prod() {
    mustHaveElements();
    return fold<double>(1.0, (prod, current) => prod * current);
  }
}
