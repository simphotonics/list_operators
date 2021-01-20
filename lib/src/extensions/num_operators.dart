import 'dart:math' as math;

import 'assertions.dart';

/// Extension providing operators for objects of type List<num>.
extension NumOperators on List<num> {
  /// Returns a new list consisting of the elements of `this` added to
  /// the elements of `other`.
  ///
  /// Note: The operator `+` is already in use and concatenates two lists.
  List<num> plus(List<num> other) {
    assertSameLength(other, operatorSymbol: '+');
    return List<num>.generate(length, (i) => this[i] + other[i]);
  }

  /// Returns a new list with elements raised to the power of `scalar`.
  List<num> pow(num scalar) {
    return List<num>.generate(length, (i) => math.pow(this[i], scalar));
  }

  /// Returns a new list consisting of the difference of the elements of `this`
  /// and `other`.
  List<num> operator -(List<num> other) {
    assertSameLength(other, operatorSymbol: '-');
    return List<num>.generate(length, (i) => this[i] - other[i]);
  }

  /// Returns the scalar product of `this` and `other`.
  ///
  /// The elements of `this` and `other` are multiplied
  /// component-wise and summed.
  ///
  /// Info: (Non-zero) numerical vectors with the
  /// property: `this * other == 0` are called orthogonal.
  num innerProduct(List<num> other) {
    assertSameLength(other, operatorSymbol: 'innerProduct()');
    num sum = 0;
    for (var i = 0; i < length; i++) {
      sum += this[i] * other[i];
    }
    return sum;
  }

  /// Returns a new list containing the elements of this
  /// multiplied with `scalar`.
  List<num> operator *(num scalar) {
    return List<num>.generate(length, (i) => this[i] * scalar);
  }

  /// Returns a new list containing the elements of `this` divided by `scalar`.
  List<num> operator /(num scalar) {
    return List<num>.generate(length, (i) => this[i] / scalar);
  }

  /// Unary operator: Returns a new list
  /// containing the elements of `this` multiplied by -1.
  List<num> operator -() {
    return List<num>.generate(length, (i) => -this[i]);
  }

  /// Returns a new list consisting of the elements of of `this`
  /// divided by `scalar` and truncated to obtain an integer.
  List<int> operator ~/(num scalar) {
    return List<int>.generate(length, (i) => this[i] ~/ scalar);
  }

  /// Returns a new list consisting of the absolute value of
  /// the elements of `this`.
  List<num> abs() {
    return List<num>.generate(length, (i) => this[i].abs());
  }

  /// Returns the minimum value.
  /// * The list must have at least one element.
  num min() {
    assertHasElements();
    return reduce((value, element) => math.min<num>(value, element));
  }

  /// Returns the maximum value.
  /// * The list must have at least one element.
  num max() {
    assertHasElements();
    return reduce((value, element) => math.max<num>(value, element));
  }

  /// Returns the mean of the list elements.
  /// * The list must have at least one element.
  num mean() {
    assertHasElements(n: 1);
    return fold<num>(0.0, (sum, element) => sum + element) / length;
  }

  /// Returns the corrected standard deviation of the list elements.
  /// * The list must have at least two elements.
  num stdDev() {
    assertHasElements(n: 2);
    final _mean = mean();
    return math.sqrt(
      fold<num>(0, (sum, element) => sum + math.pow(_mean - element, 2)) /
          (length - 1),
    );
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

  /// Returns a new list containing the elements of `this` converted to `int`.
  List<int> toInt() {
    return List<int>.generate(length, (i) => this[i].toInt());
  }

  /// Returns a new list containing the elements of `this` converted to `double`.
  List<double> toDouble() {
    return List<double>.generate(length, (i) => this[i].toDouble());
  }
}
