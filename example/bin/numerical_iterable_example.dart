import 'package:list_operators/list_operators.dart';

void main() {
  final b = [11, 12, 13];

  // Operators and method that work with Iterable<num>
  print('Minimum: b.min()');
  print(b.min());
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

  print('Sum: b.sum()');
  print(b.sum());
}
