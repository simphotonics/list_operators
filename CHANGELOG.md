## 0.3.7
- Amended docs

## 0.3.6
- Added the getters `cartesianToSpherical` and
  `sphericalToCartesian` as extension methods on
  `List<num>` and `List<List<num>>`.

## 0.3.5

- Renamed method `toInt()` -> `toListofInt()`.
- Renamed method `toDouble()` -> `toListOfDouble()`.

## 0.3.4
- Converted method `unmodifiable()` to getter `unmodifiable`.
  Applies to extensions on `List<T>` and `List<List<T>>`.
- Renamed methods starting with `assert` to `mustHave` in
  order to avoid confusion with actual asserts.

## 0.3.3
- Renamed matcher function `isCloseTo` -> `closeToList`.
- Renamed matcher `CloseTo` -> `CloseToList`.

## 0.3.2
- Updated docs.

## 0.3.1
- Updated dependencies.
- Renamed matcher `orderedCloseTo` -> `isCloseTo`.
- Extended documentation.

## 0.3.0

- Renamed method `innerProduct` -> `innerProd`.
- Made method `innerProd` available for `List<int>`

## 0.2.9

Added the list method `match`. Two lists are considered matching if their entries match
in sequential order.

## 0.2.8

- Amended docs.
- Made methods `min()`, `max()`, `prod()` available for objects of type `Iterable<num>`.

## 0.2.7

Added method `prod()` returning the product of all entries.

## 0.2.6

Made method `sum()` available for object of type `Iterable<T extends num>`.

## 0.2.5

Added method `sum()`.

## 0.2.4

Added method `exp()` to extension `NumOperators`.

## 0.2.3

Library `list_operators` now exports `assertions.dart`.

## 0.2.2

Migrated CI to github.

## 0.2.1

- Added custom matcher `orderedCloseTo` for matching numerical list
  within a certain precision.
- Amended numerical list operators to emulate the greediness of
  numerical operations involving the type `double`.
- Added tests to `num_operators_test.dart`.

## 0.2.0

- Switched back to default test suite.

## 0.1.5-nullsafety

- Added the method `unmodifiable()` defined or object of type `List<List<T>>`
  and returning an object of type `UnmodifiableListView<UnmodifiableListView<T>>`.


## 0.1.4-nullsafety

- Corrected bugs in functions `mean()` and `stdDev()`.
- Added tests.

## 0.1.3-nullsafety

- Added section 'Limitations' to file `README.md`.

## 0.1.2-nullsafety

- Added methods `min()`, `max()`, `mean()`, `stdDev()`, `abs()`, `innerProduct()`, and the unary minus operator.

## 0.1.1-nullsafety

- Added method `abs()` which is available for objects of type `List<num>`.

## 0.1.0-nullsafety

- Min. Dart SDK version now 2.12.0-0.

## 0.0.3-nullsafety

- Removed `lazy_memo` from list of dependencies.

## 0.0.2-nullsafety

- Amended docs.

## 0.0.1-nullsafety

- Initial version
