part of 'cq_color.dart';

/// Foreground Color of [ConsoleQuill]'s output.
class FGCQColor extends CQColor {
  const FGCQColor(super.value);

  @override
  String toString() {
    // It is necessary for default colors
    if (value == 39) {
      return '\x1b[${super.toString()}';
    }

    return '\x1b[38;5;${super.toString()}';
  }
}
