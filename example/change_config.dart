import 'package:quick_quotes_quill/console_quill.dart';

final quill = ConsoleQuill('Quill A');

void main() {
  quill
    ..info('Old style')
    ..config = quill.config.copyWith(
      nameColor: CQColors.lightMagenta,
      msgColor: CQColors.lightBlue,
      tagStyle: CQStyles.underlineOn,
    )
    ..info('New style');
}
