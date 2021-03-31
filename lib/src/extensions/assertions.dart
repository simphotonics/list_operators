import 'package:exception_templates/exception_templates.dart';

import '../exceptions/empty_iterable.dart';
import '../exceptions/iterable_length_mismatch.dart';
import '../exceptions/list_length_mismatch.dart';

extension ListAssertion on List {
  /// Asserts that `this` and `other` have the same length.
  /// The parameter `operatorSymbol` is mentioned in the error
  /// message.
  void assertSameLength(List other, {String operatorSymbol = ''}) {
    if (length != other.length) {
      throw ErrorOfType<ListLengthMismatch>(
          message: 'Error using \'$operatorSymbol\' with $runtimeType.',
          invalidState: 'Length of $this does not match length of $other.',
          expectedState: 'Two lists with the same length.');
    }
  }
}

extension IterableAssertion on Iterable {
  /// Asserts that an iterable has a minimum number of elements.
  void assertHasElements({int n = 1}) {
    if (length < n) {
      throw ExceptionOfType<IterableLengthMismatch>(
          message: 'Iterable must contain at least $n elements.',
          invalidState: '$this has only $length elements.');
    }
  }

  /// Asserts that an iterable is not empty.
  void assertNotEmpty() {
    if (isEmpty) {
      throw ExceptionOfType<EmptyIterable>(
        message: 'Iterable must not be empty.',
      );
    }
  }
}
