import '../console_quill.dart';
import 'cq_escape_code.dart';

part 'fg_cq_color.dart';

part 'bg_cq_color.dart';

/// Color of [ConsoleQuill]'s output.
class CQColor extends CQEscapeCode {
  /// Pass value only in range [0; 255].
  const CQColor(super.code);

  /// Get foreground color.
  FGCQColor get fg => FGCQColor(code);

  /// Get background color.
  BGCQColor get bg => BGCQColor(code);

  @override
  String toString() => '${code}m';
}
