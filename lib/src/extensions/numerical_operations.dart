import 'dart:math' as math;

import 'assertions.dart';

/// Extension providing operators for objects of type List<num>.
extension NumericalOperations on List<num> {
  /// Returns a new list consisting of the entries of `this` added to
  /// the entries of `other`.
  ///
  /// Note: The operator `+` is already in use and concatenates two lists.
  List<num> plus(List<num> other) {
    assertSameLength(other, operatorSymbol: '+');
    return List<num>.generate(length, (i) => this[i] + other[i]);
  }

  /// Returns a new list with entries raised to the power of `scalar`.
  List<num> pow(num scalar) {
    return List<num>.generate(length, (i) => math.pow(this[i], scalar));
  }

  /// Returns a new list consisting of the absolute value of
  /// the entries of `this`.
  List<num> abs() {
    return List<num>.generate(length, (i) => this[i].abs());
  }

  /// Returns a new list consisting of the difference of the elements of `this`
  /// and `other`.
  List<num> operator -(List<num> other) {
    assertSameLength(other, operatorSymbol: '-');
    return List<num>.generate(length, (i) => this[i] - other[i]);
  }

  /// Returns the scalar product of `this` and `other`.
  ///
  /// The entries of `this` and `other` are multiplied
  /// component-wise and summed.
  ///
  /// Info: (Non-zero) numerical vectors with the
  /// property: `this * other == 0` are called orthogonal.
  num operator *(List<num> other) {
    assertSameLength(other, operatorSymbol: '*');
    num sum = 0;
    for (var i = 0; i < length; i++) {
      sum += this[i] * other[i];
    }
    return sum;
  }

  /// Returns a new list consisting of the entries of `this` divided by `scalar`.
  List<num> operator /(num scalar) {
    return List<num>.generate(length, (i) => this[i] / scalar);
  }

  /// Returns a new list consisting of the entries of of `this`
  /// divided by `scalar` and truncated to obtain an integer.
  List<int> operator ~/(num scalar) {
    return List<int>.generate(length, (i) => this[i] ~/ scalar);
  }

  /// Returns a new list consting of the entries of `this` multiplied by `scalar`.
  ///
  /// Note: The operator `*` used with two numerical lists returns the
  /// scalar product of two lists.
  List<num> times(num scalar) {
    return List<num>.generate(length, (i) => this[i] * scalar);
  }

  /// Returns true if the inequality `<` holds for each component.
  bool operator <(List<num> other) {
    assertSameLength(other, operatorSymbol: '<');
    for (var i = 0; i < length; i++) {
      if (this[i] >= other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `<=` holds for each component.
  bool operator <=(List<num> other) {
    assertSameLength(other, operatorSymbol: '<');
    for (var i = 0; i < length; i++) {
      if (this[i] > other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `>` holds for each component.
  bool operator >(List<num> other) {
    assertSameLength(other, operatorSymbol: '>');
    for (var i = 0; i < length; i++) {
      if (this[i] <= other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `>=` holds for each component.
  bool operator >=(List<num> other) {
    assertSameLength(other, operatorSymbol: '>');
    for (var i = 0; i < length; i++) {
      if (this[i] < other[i]) {
        return false;
      }
    }
    return true;
  }
}
