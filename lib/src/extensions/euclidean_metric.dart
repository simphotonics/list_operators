import 'dart:math';

import 'package:exception_templates/exception_templates.dart';

import '../exceptions/length_mismatch.dart';

extension EuclideanMetric on List<num> {
  /// Returns the Euclidean distance between
  /// the origin and `this`.
  num get distanceFromOrigin =>
      sqrt(fold<num>(0, (sum, element) => sum + element * element));

  /// Returns the Euclidean distance between `this` and `other`.
  ///
  /// Throws an error if `this.length != other.length`.
  num distance(List<num> other) {
    if (length != other.length) {
      throw ErrorOfType<LengthMismatch>(
          message: 'Can\'t calculate distance between $this and $other.',
          invalidState: 'Length of other is: ${other.length}.',
          expectedState: 'The argument \'other\' must have length: $length.');
    }
    num result = 0;
    for (var i = 0; i < length; ++i) {
      result += pow(this[i] - other[i], 2);
    }
    return sqrt(result);
  }
}
