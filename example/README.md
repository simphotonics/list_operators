# List Operators - Example
[![Build Status](https://travis-ci.com/simphotonics/simulated_annealing.svg?branch=main)](https://travis-ci.com/simphotonics/simulated_annealing)

To run the program shown below navigate to the
root folder of your local copy of [list_operators] and
issue the command:
```Console
$dart --enble-experiment=non-nullable example/bin/example.dart
```

```Dart
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

```
<details><summary> Click to show console output.</summary>

```Console

dan@nano:~/list_operators$ dart example/bin/example.dart
Addition:
[12, 14, 16]

Subtraction:
[10, 10, 10]

Scalar product:
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

```
</details>


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/simphotonics/list_operators/issues

[list_operators]: https://pub.dev/packages/list_operators