import 'dart:collection' show UnmodifiableListView;

extension Unmodifiable<T> on List<T> {
  /// Returns an unmodifiable list view of this.
  UnmodifiableListView<T> get unmodifiable => UnmodifiableListView(this);
}

extension RecursiveUnmodifiable<T> on List<List<T>> {
  /// Returns an unmodifiable list view of `this`.
  ///
  /// Note: The inner lists are also unmodifiable.
  UnmodifiableListView<UnmodifiableListView<T>> get unmodifiable =>
      UnmodifiableListView<UnmodifiableListView<T>>(
          List<UnmodifiableListView<T>>.generate(
              length, (i) => UnmodifiableListView(this[i])));
}
