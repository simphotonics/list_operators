/// Extension providing the method `export`.
extension ExportListList on List<List<num>> {
  /// Converts an object of type `List<List<num>>` to a `String`.
  /// * `label`: An optional label exported as first row.
  /// * `delimiter`: Delimiter used to separate numerical values.
  /// * `precision`: Precision used when converting numbers to `String`.
  /// * `flip`: By default inner lists are exported as rows.
  ///    Set `flip` to `true` to export inner lists as columns.
  String export({
    String label = '',
    String delimiter = ' ',
    int precision = 20,
    bool flip = false,
  }) {
    final b = StringBuffer();
    if (label.isNotEmpty) b.writeln(label);

    if (flip) {
      final dims = List<num>.generate(length, (i) => this[i].length);
      var nCount = dims[0];
      if (dims.every((current) => current == nCount)) {
        for (var n = 0; n < nCount; ++n) {
          for (var i = 0; i < length; ++i) {
            b.write('${this[i][n].toStringAsPrecision(precision)}$delimiter');
          }
          b.writeln('');
        }
      } else {
        b.writeln('Could not export List<List<num>> with option <flipped>.');
        b.writeln('All sub-lists must have the same length!');
      }
    } else {
      for (var n = 0; n < length; ++n) {
        for (var i = 0; i < this[n].length; ++i) {
          b.write('${this[n][i].toStringAsPrecision(precision)}$delimiter');
        }
        b.writeln('');
      }
    }
    return b.toString();
  }
}

/// Extension providing the method `export`.
extension ExportList on List<num> {
  /// Converts an object of type `List<num>` to a `String`.
  /// * `label`: An optional label as first row.
  /// * `delimiter`: Delimiter used to separate numerical values.
  /// * `precision`: Precision used when converting numbers to `String`.
  String export({
    String label = '',
    String delimiter = ' ',
    int precision = 20,
  }) {
    final b = StringBuffer();
    if (label.isNotEmpty) b.writeln(label);

    for (var i = 0; i < length; ++i) {
      b.writeln('${this[i].toStringAsPrecision(precision)}$delimiter');
    }
    return b.toString();
  }
}
