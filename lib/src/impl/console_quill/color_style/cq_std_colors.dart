import 'cq_color.dart';

/// Standard colors.
class CQSTDColors {
  const CQSTDColors._();

  static const black = CQColor(0);
  static const red = CQColor(1);
  static const green = CQColor(2);
  static const yellow = CQColor(3);
  static const blue = CQColor(4);
  static const magenta = CQColor(5);
  static const cyan = CQColor(6);
  static const white = CQColor(7);

  /// Default foreground color.
  static const defaultFG = FGCQColor(39);

  /// Default background color.
  static const defaultBG = BGCQColor(49);
}
