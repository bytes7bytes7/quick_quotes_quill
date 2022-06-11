import 'package:quick_quotes_quill/console_quill.dart';

final quill = ConsoleQuill('Quill A');

void main() {
  quill
    ..info('Old style')
    ..config = quill.config.copyWith(
      nameBGColor: CQHIColors.white.bg,
      msgFGColor: CQHIColors.blue.fg,
      tagStyle: CQSTDStyles.underlineOn,
    )
    ..info('New style')
    ..turnOffColors()
    ..error('No more colors!');
}
