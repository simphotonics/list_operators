import 'package:exception_templates/exception_templates.dart';

import '../exceptions/empty_iterable.dart';
import '../exceptions/length_mismatch.dart';

extension MustHave on Iterable {
  /// Throws an error of type [ErrorOfType<LengthMismatch>] if
  /// `this` and `other` do *not* have the same length.
  /// ---
  /// The parameter `operatorSymbol` is used in the error
  /// message.
  void mustHaveSameLength(Iterable other, {String operatorSymbol = ''}) {
    if (length != other.length) {
      throw ErrorOfType<LengthMismatch>(
          message: 'Error using \'$operatorSymbol\' with $runtimeType.',
          invalidState: 'Length of $this does not match length of $other.',
          expectedState: 'Two lists with the same length.');
    }
  }

  /// Throws an error of type [ExceptionOfType<LengthMismatch>] if the
  /// [Iterable] does not have a minimum number of `n` elements.
  void mustHaveMinLength(int n) {
    if (this is List) {
      if (length < n) {
        throw ErrorOfType<LengthMismatch>(
            message: 'List contain at least $n elements.',
            invalidState: '$this has only $length elements.');
      }
    } else {
      // Avoid calling length on a potentially long iterable.
      final it = iterator;
      int i = 0;
      while (it.moveNext() && i < n) {
        ++i;
      }
      if (i == n) return;
      throw ErrorOfType<LengthMismatch>(
          message: 'Iterable must contain at least $n elements.',
          invalidState: '$this has only $i elements.');
    }
  }

  /// Throws an error of type [ExceptionOfType<EmptyIterable>] if the
  /// [Iterable] is empty.
  void mustHaveElements() {
    if (isEmpty) {
      throw ExceptionOfType<EmptyIterable>(
        message: 'Iterable must not be empty.',
      );
    }
  }
}
