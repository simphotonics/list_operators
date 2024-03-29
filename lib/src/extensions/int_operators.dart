import 'must_have.dart';

extension IntOperators on List<int> {
  /// Returns a new list consisting of the elements of `this` added to
  /// the elements of `other`.
  ///
  /// Note: The operator `+` is already in use and concatenates two lists.
  List<int> plus(List<int> other) {
    mustHaveSameLength(other, operatorSymbol: '+');
    return List<int>.generate(length, (i) => this[i] + other[i]);
  }

  /// Returns a new list consisting of the difference of the elements of `this`
  /// and `other`.
  List<int> operator -(List<int> other) {
    mustHaveSameLength(other, operatorSymbol: '-');
    return List<int>.generate(length, (i) => this[i] - other[i]);
  }

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
  /// property: `this * other == 0` are called *orthogonal*.
  int innerProd(List<int> other) {
    mustHaveSameLength(other, operatorSymbol: 'innerProd()');
    var sum = 0;
    for (var i = 0; i < length; i++) {
      sum += this[i] * other[i];
    }
    return sum;
  }
}
