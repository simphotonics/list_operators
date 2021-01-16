import 'package:exception_templates/exception_templates.dart';

import '../exceptions/incompatible_lists.dart';

extension SameLength on List {
  /// Asserts that `this` and `other` have the same length.
  void assertSameLength(List other, {String operatorSymbol = ''}) {
    if (length != other.length) {
      throw ErrorOfType<IncompatibleLists>(
          message: 'Error using \'$operatorSymbol\' on ${runtimeType}.',
          invalidState: 'Length of $this does not match length of $other.',
          expectedState: 'Two lists with the same length.');
    }
  }
}
