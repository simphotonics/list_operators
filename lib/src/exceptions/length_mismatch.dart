import 'package:exception_templates/exception_templates.dart';

/// Error type indicating that an expression involving [Iterable] arguments
/// could not be calculated because of a length mismatch.
class LengthMismatch extends ErrorType {}

/// ErrorType indicating that an element of an [Iterable] was accessed
/// using an invalid index.
abstract class IndexOutOfRange extends ErrorType {}
