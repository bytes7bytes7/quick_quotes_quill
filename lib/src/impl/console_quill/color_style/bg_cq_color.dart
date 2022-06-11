part of 'cq_color.dart';

/// Background Color of [ConsoleQuill]'s output.
class BGCQColor extends CQColor {
  const BGCQColor(super.value);

  @override
  String toString() {
    // It is necessary for default colors
    if (value == 49) {
      return '\x1b[${super.toString()}';
    }

    return '\x1b[48;5;${super.toString()}';
  }
}
