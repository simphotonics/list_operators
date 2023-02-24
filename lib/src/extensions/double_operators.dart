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

  /// Returns a new list containing the elements of `this` converted to `int`.
  List<int> toInt() {
    return List<int>.generate(length, (i) => this[i].toInt());
  }

  /// Returns `true` if the equality
  /// `this(i) == other(i)` holds for each index `i`.
  bool match(List<double> other, {double precision = 1e-12}) {
    if (this == other) return true;
    if (length != other.length) return false;
    final it = iterator;
    final oit = other.iterator;
    while (it.moveNext() && oit.moveNext()) {
      if ((it.current - oit.current).abs() > precision) {
        return false;
      }
    }
    return true;
  }
}

extension DoubleIterableOperators on Iterable<double> {
  /// Returns the sum of the entries.
  ///
  /// The iterable must not be empty.
  num sum() {
    mustHaveElements();
    return fold<num>(0.0, (sum, current) => sum + current);
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
