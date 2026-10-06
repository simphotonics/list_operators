import 'dart:math' as math show min, max, pow, sqrt;

import 'must_have.dart' show MustHave;

extension NumericalMethods<T extends num> on Iterable<T> {
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
