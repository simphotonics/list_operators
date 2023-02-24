import 'package:matcher/matcher.dart';

/// Returns a matcher which returns `true` if `actual[i]`
/// is larger equal `expected[i] - delta`
/// and smaller equal `expected[i] + delta` for each index `i`.
///
/// Note: The lists `actual` and `expected` must have the same length.
///
/// Usage:
/// ```
/// final actual = [9.5, 5.6, 2.8];
/// final expected = [9.81, 5.7, 3];
/// final delta = 0.5;
/// test('Comparing numerical lists', (){
///   expect(actual, closeToList(expected, delta));
/// });
/// ```
Matcher closeToList<T extends num>(List<T> expected, num delta) =>
    CloseToList<T>(expected, delta);

/// A class extending [Matcher] that matches two numerical lists
/// within a certain precision.
class CloseToList<T extends num> extends Matcher {
  CloseToList(this.expected, num delta) : delta = delta.abs();

  final List<T> expected;
  final num delta;

  @override
  bool matches(dynamic item, Map matchState) {
    final expectedLength = expected.length;
    final actualLength = item.length;
    if (expectedLength != actualLength) {
      addStateInfo(matchState, {
        'length.actual': actualLength,
        'length.expected': expectedLength,
        'length.mismatch': true,
      });
      return false;
    }
    // try {
    //   if (_expected.length != delta.length) {
    //     throw ErrorOf<Matcher>(
    //         message: 'Error using matcher \'orderedCloseTo()\'',
    //         invalidState: 'Arguments expected: $_expected and '
    //             'delta: $delta have different length.');
    //   }
    // } catch (exception, stack) {
    //   addStateInfo(matchState, {
    //     'length.delta': delta1.length,
    //     'delta.exception': exception.toString(),
    //     'delta.stack': stack.toString(),
    //   });
    // }

    final actIt = item.iterator;
    final expIt = expected.iterator;
    var i = 0;
    while (actIt.moveNext() && expIt.moveNext()) {
      if ((actIt.current - expIt.current).abs() <= delta) {
      } else {
        addStateInfo(matchState, {
          'mismatchAtPosition': i,
          'actualAtPosition': actIt.current,
          'expectedAtPosition': expIt.current,
          'delta': delta,
        });
        return false;
      }
      ++i;
    }
    return true;
  }

  @override
  Description describe(Description description) => description
      .add('a numerical iterable differing from ')
      .addDescriptionOf(expected)
      .add(' by less than ')
      .addDescriptionOf(delta);

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    final position = matchState['mismatchAtPosition'];
    final left = matchState['expectedAtPosition'] - matchState['delta'].abs();
    final right = matchState['expectedAtPosition'] + matchState['delta'].abs();
    final actualAtPosition = matchState['actualAtPosition'];

    return mismatchDescription
        .add('at position \'$position\' has value <$actualAtPosition> '
            'which is outside the valid range ')
        .addDescriptionOf([left, right]).add('.');
  }
}
