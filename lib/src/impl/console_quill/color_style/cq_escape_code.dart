import '../console_quill.dart';

/// [ConsoleQuill] escape code.
abstract class CQEscapeCode {
  const CQEscapeCode(this.code);

  /// Escape code value.
  final int code;

  @override
  String toString() => '$code';
}
