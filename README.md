# List Operators
[![Dart](https://github.com/simphotonics/list_operators/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/list_operators/actions/workflows/dart.yml)

## Introduction
The package [`list_operators`][list_operators] uses Dart extensions to provide additional operators for objects of type `List<num>` and `List<T extends Comparable>`.

## Usage
To use this package include [`list_operatos`][list_operators] as a `dependency` in your `pubspec.yaml` file.
The programs below demonstrates how to use the operators and methods defined by the library `list_operators`.

### Methods and Operators For Objects of Type List\<num\>
```Dart
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
  print(a.innerProd(b));
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
  print('\nCreating an unmodifiable list of an object of type List<List<T>>:');
  final list = [
    ['one'],
    ['two'],
  ];

  // Extension works for objects of type List<T> and List<List<T>>
  final listView = list.unmodifiable();

  // Prints: UnmodifiableListView<UnmodifiableListView<String>>
  print(listView.runtimeType);
}
```
<details><summary> Click to show console output.</summary>

```Console
$ dart numerical_list_example.dart
Absolute value:
[10, 10, 10]

Addition:
[12, 14, 16]

Subtraction:
[10, 10, 10]

Inner product:
74

Multiplication with a number:
[10, 20, 30]

Power
[1, 4, 9]

Exponentiation
[2.718281828459045, 7.38905609893065, 20.085536923187668]
[7.38905609893065, 54.598150033144236, 403.4287934927351]

b.distanceFromOrigin()
20.83266665599966

b.distance(a)
17.320508075688775

Concatenation:
[1, 2, 3, 11, 12, 13]

Creating an unmodifiable list of an object of type List<List<T>>:
UnmodifiableListView<UnmodifiableListView<String>>
```
</details><br/>

### Methods For Objects of Type Iterable\<num\>

```Dart
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

```
<details><summary> Click to show console output.</summary>

```Console
$ dart numerical_iterable_example.dart
Minimum: b.min()
11

Maximum: b.max()
13

Mean: b.mean()
12.0

Product of all entries: b.prod()
1716

Standard deviation: b.stdDev()
1.0

Sum: b.sum()
36

```

</details><br/>

### Operators For Objects of Type List\<T extends Comparable\>

```Dart
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
```
<details><summary> Click to show console output.</summary>

```Console
$ dart comparable_list_example.dart
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
```
</details><br/>

### Methods for Exporting Numerical Lists as a String

```Dart
import 'package:list_operators/list_operators.dart';
void main() {
  final a = [1, 2, 3];

  /// Exporting numerical lists to a `String` object.
  print('Exporting lists to String:');
  print(a.export(
    label: '<<Sample label>>',
    delimiter: ', ',
    precision: 4,
  ));

  print('Exporting an object of type List<List<num>> to String:');
  print('Each inner list is exported as a row.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(label: '<<Sample label>>', precision: 6));

  print('Exporting an object of type List<List<num>> to String.');
  print('Inner lists are exported as columns.');
  print([
    [1, 2, 3],
    [101, 102, 103]
  ].export(
    label: '<<Sample label>>',
    precision: 6,
    flip: true,
  ));
}
```
<details><summary> Click to show console output.</summary>

```Console
$ dart export_to_string_example.dart
Exporting lists to String:
<<Sample label>>
1.000,
2.000,
3.000,

Exporting an object of type List<List<num>> to String:
Each inner list is exported as a row.
<<Sample label>>
1.00000 2.00000 3.00000
101.000 102.000 103.000

Exporting an object of type List<List<num>> to String.
Inner lists are exported as columns.
<<Sample label>>
1.00000 101.000
2.00000 102.000
3.00000 103.000
```
</details>


## Limitations

In its current version, Dart does not support function (and implicitly operator) overloading.
For this reason some numerical operations defined by [`list_operators`][list_operators]
are not symmetrical, even though intuitively they should be:
- The expression `[1, 2, 3] * 10` is defined and the result is `[10, 20, 30]`.
- The expression `10 * [1, 2, 3]` is not defined since the `*` operator defined for objects of type `int`
expects a second operand of type `num`.

Note: The `+` operator (concatenates two lists) is already defined by Dart's abstract class [`List`][List] and
cannot be overridden by an extension on [`List`][List].
To add two numerical lists element by element use the method: `List<num> plus(List<num> other)`.

## Examples

The program shown above is included in the folder [`example`][example].

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/simphotonics/list_operators/issues

[list_operators]: https://pub.dev/packages/list_operators

[List]: https://api.dart.dev/stable/dart-core/List-class.html

[example]: https://github.com/simphotonics/list_operators/tree/main/example
