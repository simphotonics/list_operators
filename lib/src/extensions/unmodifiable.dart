import 'dart:collection';

extension Unmodifiable<T> on List<T> {
  /// Returns an unmodifiable list view of this.
  UnmodifiableListView<T> unmodifiable() => UnmodifiableListView(this);
}

extension RecursiveUnmodifiable<T> on List<List<T>> {
  /// Returns an unmodifiable list view of this.
  ///
  /// Note: The inner lists are also unmodifiable.
  UnmodifiableListView<UnmodifiableListView<T>> unmodifiable() =>
      UnmodifiableListView<UnmodifiableListView<T>>(
          List<UnmodifiableListView<T>>.generate(
              length, (i) => UnmodifiableListView(this[i])));
}
