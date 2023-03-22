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
