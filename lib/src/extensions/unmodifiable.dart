import 'dart:collection';

/// Extension providing the method `unmodifiable()`.
extension Unmodifiable<T> on List<T> {
  /// Returns an unmodifiable list view of this.
  UnmodifiableListView<T> unmodifiable() => UnmodifiableListView(this);
}

/// Extension providing the method `unmodifiable()`.
extension RecursiveUnmodifiable<T> on List<List<T>> {
  /// Returns an unmodifiable list view of `this`.
  ///
  /// Note: The inner lists are also unmodifiable.
  UnmodifiableListView<UnmodifiableListView<T>> unmodifiable() =>
      UnmodifiableListView<UnmodifiableListView<T>>(
          List<UnmodifiableListView<T>>.generate(
              length, (i) => UnmodifiableListView(this[i])));
}
