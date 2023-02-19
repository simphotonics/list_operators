import 'assertions.dart';

/// Extension providing the operators:
/// * `this < other`,
/// * `this <= other`,
/// * `this > other`,
/// * `this >= other`.
extension Comparison<T extends Comparable> on List<T> {
  /// Returns `true` if the inequality
  /// `this(i) < other(i)` holds for each index `i`.
  bool operator <(List<T> other) {
    assertSameLength(other, operatorSymbol: '<');
    for (var i = 0; i < length; i++) {
      if (this[i].compareTo(other[i]) >= 0) return false;
    }
    return true;
  }

  /// Returns `true` if the inequality
  /// `this(i) <= other(i)` holds for each index `i`.
  bool operator <=(List<T> other) {
    assertSameLength(other, operatorSymbol: '<=');
    for (var i = 0; i < length; i++) {
      if (this[i].compareTo(other[i]) > 0) return false;
    }
    return true;
  }

  /// Returns `true` if the inequality
  /// `this(i) > other(i)` holds for each index `i`.
  bool operator >(List<T> other) {
    assertSameLength(other, operatorSymbol: '>');
    for (var i = 0; i < length; i++) {
      if (this[i].compareTo(other[i]) <= 0) return false;
    }
    return true;
  }

  /// Returns `true` if the inequality
  /// `this(i) >= other(i)` holds for each index `i`.
  bool operator >=(List<T> other) {
    assertSameLength(other, operatorSymbol: '>=');
    for (var i = 0; i < length; i++) {
      if (this[i].compareTo(other[i]) < 0) return false;
    }
    return true;
  }

  /// Returns `true` if the equality
  /// `this(i) == other(i)` holds for each index `i`.
  bool equal(List<T> other) {
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
}
