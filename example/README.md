# List Operators - Example
[![Build Status](https://travis-ci.com/simphotonics/list_operators.svg?branch=main)](https://travis-ci.com/simphotonics/list_operators)

To run the program shown below navigate to the
root folder of your local copy of [list_operators] and
issue the command:
```Console
$dart example/bin/example.dart
```

```Dart
import 'package:list_operators/list_operators.dart';

void main(List<String> args) {
  final a = [1, 2, 3];
  final b = [11, 12, 13];

  /// Use with List<num>
  print('Absolute value:');
  print((a - b).abs());

  print('Addition:');
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
}

```
<details><summary> Click to show console output.</summary>

```Console

dan@nano:~/list_operators$ dart example/bin/example.dart
Absolute value:
[10, 10, 10]

Addition:
[12, 14, 16]

Subtraction:
[10, 10, 10]

Inner product:
74

Multiplication:
[10, 20, 30]

Power
[1, 4, 9]

b.distanceFromOrigin()
20.83266665599966

b.distance(a)
17.320508075688775

a < b:
true

a <= b:
true

a > b:
false

b >= b:
true

s1 <= s2
true

Concatenation:
[1, 2, 3, 11, 12, 13]

Exporting lists to String:
Sample label
1.000,
2.000,
3.000,


Exporting an object of type List<List<num>> to String:
Each inner list is exported as a row.
Sample label
1.00000 2.00000 3.00000
101.000 102.000 103.000


Exporting an object of type List<List<num>> to String.
Inner lists are exported as columns.
Sample label
1.00000 101.000
2.00000 102.000
3.00000 103.000

```
</details>


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/simphotonics/list_operators/issues

[list_operators]: https://pub.dev/packages/list_operators