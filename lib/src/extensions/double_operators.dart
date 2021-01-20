import 'dart:math' as math;

import 'assertions.dart';

/// Provides operators and methods for object of type List<double>.
extension DoubleOperators on List<double> {
  /// Returns a new list with elements: `this[i] - other[i]`.
  List<double> operator -(List<num> other) {
    assertSameLength(other, operatorSymbol: '-');
    return List<double>.generate(length, (i) => this[i] - other[i]);
  }

  /// Returns a new list with elements: `this[i] + other[i]`.
  List<double> plus(List<num> other) {
    assertSameLength(other, operatorSymbol: '+');
    return List<double>.generate(length, (i) => this[i] + other[i]);
  }

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
