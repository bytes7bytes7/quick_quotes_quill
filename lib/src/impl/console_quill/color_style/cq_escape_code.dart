/// ANSI escape code.
abstract class CQEscapeCode {
  const CQEscapeCode(this.value);

  /// Escape code value.
  final int value;

  @override
  String toString() => '${value}m';
}
