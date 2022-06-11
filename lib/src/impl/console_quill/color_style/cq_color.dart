import '../console_quill.dart';
import 'cq_escape_code.dart';

part 'fg_cq_color.dart';

part 'bg_cq_color.dart';

/// Color of [ConsoleQuill]'s output.
class CQColor extends CQEscapeCode {
  /// Pass only value in range [0; 255].
  const CQColor(super.value);

  /// Get foreground color.
  FGCQColor get fg => FGCQColor(value);

  /// Get background color.
  BGCQColor get bg => BGCQColor(value);
}
