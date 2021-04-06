import 'package:list_operators/list_operators.dart';

void main() {
  final a = [1, 2, 3];
  final b = [11, 12, 13];

  /// Use with List<num>
  print('Absolute value:');
  print((a - b).abs());
  print('');

  print('Addition:');
  print(a.plus(b));
  print('');

  print('Subtraction:');
  print(b - a);
  print('');

  print('Inner product:');
  print(a.innerProduct(b));
  print('');

  print('Multiplication with a number:');
  print(a * 10);
  print('');

  print('Power');
  print(a.pow(2));
  print('');

  print('Exponentiation');
  print(a.exp());
  print(a.exp(2));
  print('');

  print('b.distanceFromOrigin()');
  print(b.distanceFromOrigin);
  print('');

  print('b.distance(a)');
  print(b.distance(a));
  print('');

  /// Dart built-in operator:
  print('Concatenation:');
  print(a + b);
  print('');

  // Creating an unmodifiable list view (recursively)
  print('Creating an unmodifiable list of an object of type List<List<T>>:');
  final list = [
    ['one'],
    ['two'],
  ];

  // Extension works for objects of type List<T> and List<List<T>>
  final listView = list.unmodifiable();

  // Prints: UnmodifiableListView<UnmodifiableListView<String>>
  print(listView.runtimeType);
}
