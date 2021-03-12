import 'package:list_operators/list_operators.dart';

void main() {
  final a = [1, 2, 3];
  final b = [11, 12, 13];

  // Use with List<num>
  print('Absolute value:');
  print((a - b).abs());

  print('\nAddition:');
  print(a.plus(b));

  print('\nSubtraction:');
  print(b - a);

  print('\nInner product:');
  print(a.innerProduct(b));

  print('\nMultiplication:');
  print(a * 10);

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
  print(b >= b);

  final s1 = ['a1', 'a2'];
  final s2 = ['b1', 'b2'];

  print('\ns1 <= s2');
  print(s1 < s2);

  /// Provided by Dart
  print('\nConcatenation:');
  print(a + b);

  /// Exporting numerical lists to a `String` object.
  print('\nExporting lists to String:');
  print(a.export(
    label: 'Sample label',
    delimiter: ', ',
    precision: 4,
  ));

  print('\nExporting an object of type List<List<num>> to String:');
  print('Each inner list is exported as a row.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(label: 'Sample label', precision: 6));

  print('\nExporting an object of type List<List<num>> to String.');
  print('Inner lists are exported as columns.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(
    label: 'Sample label',
    precision: 6,
    flip: true,
  ));

  // Creating an unmodifiable list view (recursively)
  print(
    '\nCreating an unmodifiable list view of an object of type List<List<T>>:',
  );
  final list = [
    ['one'],
    ['two'],
  ];

  // Extension works for objects of type List<T> and List<List<T>>
  final listView = list.unmodifiable();

  // Prints: UnmodifiableListView<UnmodifiableListView<String>>
  print('$listView   runtimeType: ${listView.runtimeType}');
}
