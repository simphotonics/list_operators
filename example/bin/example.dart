import 'package:list_operators/list_operators.dart';

void main(List<String> args) {

  final a = [1, 2, 3];
  final b = [11, 12, 13];

  /// Use with List<num>
  print('Addition:');
  print(a.plus(b));

  print('\nSubtraction:');
  print(b - a);

  print('\nScalar product:');
  print(a * b);

  print('\nMultiplication:');
  print(a.times(10));

  print('\nPower');
  print(a.pow(2));

  print('\nb.distanceFromOrigin()');
  print(b.distanceFromOrigin);

  print('\nb.distance(a)');
  print(b.distance(a));


  /// Use with List<T extends Comparable>
  print('\na < b:');
  print(a < b);

  print('\na <= b:');
  print(a <= b);

  print('\na > b:');
  print(a > b);

  print('\nb >= b:');
  print(b >= a);

  final s1 = ['a1', 'a2'];
  final s2 = ['b1', 'b2'];

  print('\ns1 <= s2');
  print(s1 < s2);

  /// Provided by Dart
  print('\nConcatenation:');
  print(a + b);
}
