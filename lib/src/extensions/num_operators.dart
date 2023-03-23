import 'dart:math' as math;

import 'must_have.dart';

extension NumOperators on List<num> {
  /// Returns a new list consisting of the elements of `this` added to
  /// the elements of `other`.
  ///
  /// Note: The operator `+` is already in use and concatenates two lists.
  List<num> plus(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '+');
    if (this is List<int> && other is List<int>) {
      return List<int>.generate(length, (i) => (this[i] as int) + other[i]);
    }
    if (other is List<double>) {
      return List<double>.generate(
        length,
        (i) => other[i] + this[i],
      );
    }
    if (this is List<double>) {
      return List<double>.generate(
          length, (i) => (this[i] as double) + other[i]);
    }
    return List<num>.generate(length, (i) => this[i] + other[i]);
  }

  /// Returns a new list with elements raised to the power of `scalar`.
  List<num> pow(num scalar) {
    if (this is List<int> && scalar is int && scalar >= 0) {
      return List<int>.generate(
        length,
        (i) => math.pow(this[i], scalar) as int,
      );
    } else if (this is List<double> || scalar is double) {
      return List<double>.generate(
        length,
        (i) => math.pow(this[i], scalar) as double,
      );
    }
    return List<num>.generate(length, (i) => math.pow(this[i], scalar));
  }

  /// Returns a new list with elements multiplied by `scalar` and exponentiated.
  List<double> exp([num scalar = 1.0]) => List<double>.generate(
        length,
        (i) => math.exp(this[i] * scalar),
      );

  /// Returns a new list consisting of the difference of the elements of `this`
  /// and `other`.
  List<num> operator -(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '-');
    if (this is List<int> && other is List<int>) {
      return List<int>.generate(length, (i) => (this[i] as int) - other[i]);
    }
    if (this is List<double>) {
      return List<double>.generate(
        length,
        (i) => this[i].toDouble() - other[i],
      );
    }
    if (other is List<double>) {
      return List<double>.generate(length, (i) => this[i] - other[i]);
    }
    return List<num>.generate(length, (i) => this[i] - other[i]);
  }

  /// Returns the scalar product of `this` and `other`.
  ///
  /// * The elements of `this` and `other` are multiplied
  /// component-wise and summed.
  /// * Returns an `int` if both lists are of type `List<int>`,
  /// otherwise returns a `double`.
  ///
  /// Info: Non-zero numerical vectors with the
  /// property: `this * other == 0` are called orthogonal.
  num innerProd(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: 'innerProd()');
    num sum = 0;
    for (var i = 0; i < length; i++) {
      sum += this[i] * other[i];
    }
    return sum;
  }

  /// Returns a new list containing the elements of this
  /// multiplied with `scalar`.
  List<num> operator *(num scalar) {
    if (this is List<int> && scalar is int) {
      return List<int>.generate(length, (i) => (this[i] as int) * scalar);
    } else if (this is List<double> || scalar is double) {
      return List<double>.generate(length, (i) => this[i].toDouble() * scalar);
    }
    return List<num>.generate(length, (i) => this[i] * scalar);
  }

  /// Returns a new list containing the elements of `this` divided by `scalar`.
  List<double> operator /(num scalar) => List<double>.generate(
        length,
        (i) => this[i] / scalar,
      );

  /// Unary operator: Returns a new list
  /// containing the elements of `this` multiplied by -1.
  List<num> operator -() {
    if (this is List<int>) {
      return List<int>.generate(length, (i) => -(this[i] as int));
    } else if (this is List<double>) {
      return List<double>.generate(length, (i) => -(this[i] as double));
    } else {
      return List<num>.generate(length, (i) => -this[i]);
    }
  }

  /// Returns a new list consisting of the elements of of `this`
  /// divided by `scalar` and truncated to obtain an integer.
  List<int> operator ~/(num scalar) {
    return List<int>.generate(length, (i) => this[i] ~/ scalar);
  }

  /// Returns a new list consisting of the absolute value of
  /// the elements of `this`.
  List<num> abs() {
    if (this is List<int>) {
      return List<int>.generate(length, (i) => (this[i] as int).abs());
    } else if (this is List<double>) {
      return List<double>.generate(length, (i) => (this[i] as double).abs());
    } else {
      return List<num>.generate(length, (i) => this[i].abs());
    }
  }

  /// Returns true if the inequality `<` holds for each component.
  bool operator <(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '<');
    for (var i = 0; i < length; i++) {
      if (this[i] >= other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `<=` holds for each component.
  bool operator <=(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '<');
    for (var i = 0; i < length; i++) {
      if (this[i] > other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `>` holds for each component.
  bool operator >(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '>');
    for (var i = 0; i < length; i++) {
      if (this[i] <= other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns true if the inequality `>=` holds for each component.
  bool operator >=(List<num> other) {
    mustHaveSameLength(other, operatorSymbol: '>');
    for (var i = 0; i < length; i++) {
      if (this[i] < other[i]) {
        return false;
      }
    }
    return true;
  }

  /// Returns a new list containing the elements of `this` rounded to [int].
  List<int> toListOfInt() {
    return List<int>.generate(length, (i) => this[i].round());
  }

  /// Returns a new list containing the elements of `this` rounded to [double].
  List<double> toListOfDouble() {
    return List<double>.generate(length, (i) => this[i].roundToDouble());
  }

  /// Returns `true` if the inequality
  /// `(this(i) - other(i)).abs() <= precision` holds for each index `i`.
  bool match(List<num> other, {double precision = 1e-12}) {
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

extension NumIterableMethods<T extends num> on Iterable<T> {
  /// Returns the minimum value.
  /// * The list must have at least one element.
  T min() {
    mustHaveElements();
    return reduce((value, element) => math.min(value, element));
  }

  /// Returns the maximum value.
  /// * The list must have at least one element.
  T max() {
    mustHaveElements();
    return reduce((value, element) => math.max(value, element));
  }

  /// Returns the sum of the entries.
  ///
  /// The iterable must not be empty.
  T sum() {
    mustHaveElements();
    return reduce((value, current) => (value + current) as T);
  }

  /// Returns the mean of the list elements.
  /// * The list must have at least one element.
  double mean() {
    mustHaveElements();
    return sum() / length;
  }

  /// Returns the product of the entries.
  ///
  /// The iterable must not be empty.
  T prod() {
    mustHaveElements();
    return reduce((value, current) => (value * current) as T);
  }

  /// Returns the corrected standard deviation of the list elements.
  /// * The list must have at least two elements.
  double stdDev() {
    mustHaveMinLength(2);
    final mean = this.mean();
    double sum = 0.0;
    final it = iterator;
    while (it.moveNext()) {
      sum += math.pow(mean - it.current, 2);
    }
    return math.sqrt(sum / (length - 1));
  }
}
