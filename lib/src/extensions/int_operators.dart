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

  /// Returns `true` if the equality
  /// `this(i) == other(i)` holds for each index `i`.
  bool equal(List<int> other) {
    if (this == other) return true;
    if (length != other.length) return false;
    final it = iterator;
    final oit = other.iterator;
    while (it.moveNext() && oit.moveNext()) {
      if (it.current != oit.current) {
        return false;
      }
    }
    return true;
  }

  /// Returns the scalar product of `this` and `other`.
  ///
  /// * The elements of `this` and `other` are multiplied
  /// component-wise and summed.
  /// Info: Non-zero numerical vectors with the
  /// property: `this * other == 0` are called orthogonal.
  int innerProd(List<int> other) {
    assertSameLength(other, operatorSymbol: 'innerProd()');
    var sum = 0;
    for (var i = 0; i < length; i++) {
      sum += this[i] * other[i];
    }
    return sum;
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
