import 'package:exception_templates/exception_templates.dart';
import 'package:matcher/matcher.dart';
import 'package:matcher/src/feature_matcher.dart';

import '../extensions/num_operators.dart';

/// Returns a matcher which matches if the match argument `actual`
/// is in the range: `expected - delta`, `expected.plus(delta)`.
///
/// Note: All arguments are of type `Iterable<num>` and must have the
/// same length in order to match.
///
/// Usage:
/// ```
/// final actual = [9.5, 5, 2];
/// final expected = [9.81, 5.7, 3];
/// final delta = [0.5, 1.0, 1.0];
/// test('Comparing numerical lists', (){
///   expect(actual, orderedCloseTo(expected, delta));
/// });
/// ```
Matcher orderedCloseTo(Iterable<num> expected, Iterable<num> delta) =>
    _OrderedCloseTo(expected, delta);

class _OrderedCloseTo extends FeatureMatcher<Iterable<num>> {
  _OrderedCloseTo(this.expected, this.delta)
      : _expected = expected.toList(),
        _delta = delta.toList();

  final Iterable<num> expected;
  final Iterable<num> delta;
  final List<num> _expected;
  final List<num> _delta;

  @override
  bool typedMatches(Iterable<num> actual, Map matchState) {
    final _actual = actual.toList();
    if (_expected.length != _actual.length) {
      addStateInfo(matchState, {
        'length.actual': _actual.length,
        'length.expected': _expected.length,
        'length.mismatch': true,
      });
      return false;
    }
    try {
      if (_expected.length != _delta.length) {
        throw ErrorOf<Matcher>(
            message: 'Error using matcher \'orderedCloseTo()\'',
            invalidState: 'Arguments expected: $_expected and '
                'delta: $_delta have different length.');
      }
    } catch (exception, stack) {
      addStateInfo(matchState, {
        'length.delta': delta.length,
        'delta.exception': exception.toString(),
        'delta.stack': stack.toString(),
      });
    }

    final actIt = actual.iterator;
    final expIt = expected.iterator;
    final deltaIt = delta.iterator;
    var i = 0;
    while (actIt.moveNext() && expIt.moveNext() && deltaIt.moveNext()) {
      if ((actIt.current - expIt.current).abs() <= deltaIt.current.abs()) {
      } else {
        addStateInfo(matchState, {
          'mismatchAtPosition': i,
          'actualAtPosition': actIt.current,
          'expectedAtPosition': expIt.current,
          'deltaAtPosition': deltaIt.current,
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
      .addDescriptionOf(_expected)
      .add(' by less than ')
      .addDescriptionOf(_delta.abs());

  @override
  Description describeTypedMismatch(
    Iterable<num> actual,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    final _position = matchState['mismatchAtPosition'];
    final _left =
        matchState['expectedAtPosition'] - matchState['deltaAtPosition'].abs();
    final _right =
        matchState['expectedAtPosition'] + matchState['deltaAtPosition'].abs();
    final _actualAtPosition = matchState['actualAtPosition'];

    return mismatchDescription
        .add('at position \'$_position\' has value $_actualAtPosition '
            'and is outside the valid range ')
          ..addDescriptionOf([_left, _right]);
  }
}
