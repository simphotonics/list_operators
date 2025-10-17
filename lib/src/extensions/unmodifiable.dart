extension Unmodifiable<T> on List<T> {
  /// Returns an unmodifiable list containing the elements of this.
  List<T> get unmodifiable => List<T>.unmodifiable(this);
}

extension RecursiveUnmodifiable<T> on List<List<T>> {
  /// Returns an unmodifiable list containing the elements of List that are
  /// also unmodifiable.
  List<List<T>> get unmodifiable => List<List<T>>.unmodifiable([
    for (final list in this) List<T>.unmodifiable(list),
  ]);
}
