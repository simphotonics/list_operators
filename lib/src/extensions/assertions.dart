import 'package:exception_templates/exception_templates.dart';

import '../exceptions/incompatible_lists.dart';

extension Assertions<T> on List<T> {
  /// Asserts that `this` and `other` have the same length.
  void assertSameLength(List other, {String operatorSymbol = ''}) {
    if (length != other.length) {
      throw ErrorOfType<IncompatibleLists>(
          message: 'Error using \'$operatorSymbol\' with $runtimeType.',
          invalidState: 'Length of $this does not match length of $other.',
          expectedState: 'Two lists with the same length.');
    }
  }

  /// Asserts that the list has a minimum number of elements.
  void assertHasElements({int n = 1}) {
    if (length < n) {
      throw ErrorOf<List<T>>(
          message: 'List must contain at least $n elements.',
          invalidState: '$this has only $length elements.');
    }
  }
}
