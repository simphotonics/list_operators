import 'package:exception_templates/exception_templates.dart';

import '../../exception/length_mismatch.dart' show LengthMismatch;

extension IterableComparison<T extends Comparable<Object>> on Iterable<T> {
  /// Returns `true` if the inequality
  /// `this(i) < other(i)` holds for each index `i`.
  bool operator <(Iterable<T> other) {
    final it = iterator;
    final oit = other.iterator;
    bool itHasElement = it.moveNext();
    bool oitHasElement = oit.moveNext();
    while (itHasElement && oitHasElement) {
      if (it.current.compareTo(oit.current) >= 0) {
        return false;
      }
      itHasElement = it.moveNext();
      oitHasElement = oit.moveNext();
    }
    if (itHasElement == oitHasElement) {
      // Same length
      return true;
    } else {
      throw ErrorOfType<LengthMismatch>(
        message: 'Error using \'<\' with $runtimeType.',
        invalidState: 'Length of $this does not match length of $other.',
        expectedState: 'Two iterables with the same length.',
      );
    }
  }

  /// Returns `true` if the inequality
  /// `this(i) <= other(i)` holds for each index `i`.
  bool operator <=(Iterable<T> other) {
    final it = iterator;
    final oit = other.iterator;
    bool itHasElement = it.moveNext();
    bool oitHasElement = oit.moveNext();
    while (itHasElement && oitHasElement) {
      if (it.current.compareTo(oit.current) > 0) {
        return false;
      }
      itHasElement = it.moveNext();
      oitHasElement = oit.moveNext();
    }
    if (itHasElement == oitHasElement) {
      // Same length
      return true;
    } else {
      throw ErrorOfType<LengthMismatch>(
        message: 'Error using \'<=\' with $runtimeType.',
        invalidState: 'Length of $this does not match length of $other.',
        expectedState: 'Two iterables with the same length.',
      );
    }
  }

  /// Returns `true` if the inequality
  /// `this(i) > other(i)` holds for each index `i`.
  bool operator >(Iterable<T> other) {
    final it = iterator;
    final oit = other.iterator;
    bool itHasElement = it.moveNext();
    bool oitHasElement = oit.moveNext();
    while (itHasElement && oitHasElement) {
      if (it.current.compareTo(oit.current) <= 0) {
        return false;
      }
      itHasElement = it.moveNext();
      oitHasElement = oit.moveNext();
    }
    if (itHasElement == oitHasElement) {
      // Same length
      return true;
    } else {
      throw ErrorOfType<LengthMismatch>(
        message: 'Error using \'>\' with $runtimeType.',
        invalidState: 'Length of $this does not match length of $other.',
        expectedState: 'Two iterables with the same length.',
      );
    }
  }

  /// Returns `true` if the inequality
  /// `this(i) >= other(i)` holds for each index `i`.
  bool operator >=(Iterable<T> other) {
    final it = iterator;
    final oit = other.iterator;
    bool itHasElement = it.moveNext();
    bool oitHasElement = oit.moveNext();
    while (itHasElement && oitHasElement) {
      if (it.current.compareTo(oit.current) < 0) {
        return false;
      }
      itHasElement = it.moveNext();
      oitHasElement = oit.moveNext();
    }
    if (itHasElement == oitHasElement) {
      // Same length
      return true;
    } else {
      throw ErrorOfType<LengthMismatch>(
        message: 'Error using \'>\' with $runtimeType.',
        invalidState: 'Length of $this does not match length of $other.',
        expectedState: 'Two iterables with the same length.',
      );
    }
  }

  /// Returns `true` if the equality
  /// `this(i) == other(i)` holds for each index `i`.
  bool equal(Iterable<T> other) {
    if (this == other) return true;
    final it = iterator;
    final oit = other.iterator;
    bool itHasElement = it.moveNext();
    bool oitHasElement = oit.moveNext();
    while (itHasElement && oitHasElement) {
      if (it.current != oit.current) {
        return false;
      }
      itHasElement = it.moveNext();
      oitHasElement = oit.moveNext();
    }
    if (itHasElement == oitHasElement) {
      // Same length
      return true;
    } else {
      return false;
    }
  }
}
