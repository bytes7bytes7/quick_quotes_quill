import '../console_quill.dart';
import 'cq_style.dart';

/// Style of [ConsoleQuill]'s output.
class CQSTDStyles {
  const CQSTDStyles._();

  static const normal = CQStyle(0);

  static const boldOn = CQStyle(1);
  static const boldOff = CQStyle(21);

  static const italicOn = CQStyle(3);
  static const italicOff = CQStyle(23);

  static const underlineOn = CQStyle(4);
  static const underlineOff = CQStyle(24);

  static const crossedOn = CQStyle(9);
  static const crossedOff = CQStyle(29);
}
