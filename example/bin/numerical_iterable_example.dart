import 'package:list_operators/list_operators.dart';

void main() {
  final a = [10.0, 11.0, 12.0];
  final b = <num>[11.0, 12, 13];
  final c = [0, 1, 2];

  // Operators and method that work with Iterable<num>
  print('Minimum: a.min()');
  print(a.min());
  print('');

  print('Minimum: b.min()');
  print(b.min());
  print('');

  print('Minimum: c.min()');
  print(c.min());
  print('');

  print('Maximum: b.max()');
  print(b.max());
  print('');

  print('Mean: b.mean()');
  print(b.mean());
  print('');

  print('Product of all entries: b.prod()');
  print(b.prod());
  print('');

  print('Standard deviation: b.stdDev()');
  print(b.stdDev());
  print('');

  print('Sum: a.sum()');
  print(a.sum());
  print('');

  print('Sum: b.sum()');
  print(b.sum());
  print('');

  print('Sum: c.sum()');
  print(c.sum());

  print(c.toListOfDouble());
}
