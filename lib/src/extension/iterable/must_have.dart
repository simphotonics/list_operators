import 'package:exception_templates/exception_templates.dart';

import '../../exception/empty_iterable.dart';
import '../../exception/length_mismatch.dart';

extension MustHave on Iterable {
  /// Throws an error of type [ErrorOfType] with type argument [LengthMismatch]
  /// if `this` and [other] do *not* have the same length.
  ///
  /// The parameter `operatorSymbol` is used in the error
  /// message.
  void mustHaveSameLength(Iterable other, {String operatorSymbol = ''}) {
    if (isEmpty && other.isEmpty) return;
    if (this is List && other is List && length == other.length) return;
    if (this is List || other is List) {
      final it = (this is List) ? iterator : other.iterator;
      int i = 0;
      int iMax = (this is List) ? length : other.length;
      bool hasElement = it.moveNext();
      while (hasElement && i < iMax) {
        ++i;
        hasElement = it.moveNext();
      }
      if (i == iMax - 1 && !hasElement) return;
    }
    final it = iterator;
    final oit = other.iterator;
    bool hasElement = it.moveNext();
    bool otherHasElement = oit.moveNext();
    while (hasElement && otherHasElement) {
      hasElement = it.moveNext();
      otherHasElement = oit.moveNext();
    }
    if (hasElement == otherHasElement) return;
    throw ErrorOfType<LengthMismatch>(
      message: 'Error using \'$operatorSymbol\' with $runtimeType.',
      invalidState: 'Length of $this does not match length of $other.',
      expectedState: 'Two iterables with the same length.',
    );
  }

  /// Throws an error of type [ExceptionOfType] with type argument
  /// [LengthMismatch] if this does not have a minimum of [n] elements.
  void mustHaveMinLength(int n) {
    if (this is List) {
      if (length < n) {
        throw ErrorOfType<LengthMismatch>(
          message: 'List contain at least $n elements.',
          invalidState: '$this has only $length elements.',
        );
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
        invalidState: '$this has only $i elements.',
      );
    }
  }

  /// Throws an error of type [ExceptionOfType] with type argument
  /// [EmptyIterable] if this is empty.
  void mustHaveElements() {
    if (isEmpty) {
      throw ExceptionOfType<EmptyIterable>(
        message: 'Iterable must not be empty.',
      );
    }
  }
}
