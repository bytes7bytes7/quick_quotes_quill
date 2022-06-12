import 'cq_escape_code.dart';

/// Style of [ConsoleQuill]'s output.
class CQStyle extends CQEscapeCode {
  const CQStyle(super.code, [this.styles = const []]);

  /// Combination of styles.
  final List<CQStyle> styles;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final style in styles) {
      buffer.write(_getEscapeSeq(style.code));
    }

    buffer.write(_getEscapeSeq(code));

    return buffer.toString();
  }

  /// Combine [CQStyle]s.
  CQStyle operator +(CQStyle other) {
    return CQStyle(code, [other]);
  }

  String _getEscapeSeq(int c) => '\x1b[${c}m';
}
