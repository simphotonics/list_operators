import 'package:list_operators/list_operators.dart';

void main() {
  final a = [1, 2, 3];
  final b = [11, 12, 13];

  // Operators that work with List<T extends Comparable>
  print('a < b:');
  print(a < b);
  print('');

  print('a <= b:');
  print(a <= b);
  print('');

  print('a > b:');
  print(a > b);
  print('');

  print('b >= b:');
  print(b >= b);
  print('');

  final s1 = ['a1', 'a2'];
  final s2 = ['b1', 'b2'];

  print('s1 <= s2');
  print(s1 < s2);
}
