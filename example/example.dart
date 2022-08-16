import 'dart:io';

import 'package:quick_quotes_quill/all.dart';

void main() {
  singleQuill();
  fileQuill();
  spreadQuillManger();
  accessQuillManager();
  changeConfig();
  customize();
}

final quill = ConsoleQuill('Single');

void singleQuill() {
  divide(10, 5);
}

double divide(int a, int b) {
  if (b == 0) {
    quill.error('$b can not be 0');
    throw Exception('Zero division');
  }

  quill.info('b != 0');

  final r = a / b;
  quill.log('$a / $b = $r');

  return r;
}

void fileQuill() {
  FileQuill('File Quill', dir: Directory.current)
    ..info('Some information')
    ..log('Simple message');
}

void spreadQuillManger() {
  SpreadQuillManager('Test manager')
    ..initialize([
      ConsoleQuill('Quill A'),
      ConsoleQuill('Quill B'),
    ])
    ..info('There are 2 quills')
    ..log('Nothing interesting')
    ..error('Something is wrong...');
}

void accessQuillManager() {
  final quillManager = AccessQuillManager('Test manager')
    ..initialize([
      ConsoleQuill('Quill A'),
      ConsoleQuill('Quill B'),
    ]);

  final quillB = quillManager.quill('Quill B');
  if (quillB != null) {
    quillB.info('I am here!');

    final quillX = quillManager.quill('Quill X');
    if (quillX == null) {
      quillB.error('"Quill X" does not exist');
    }
  }
}

void changeConfig() {
  quill
    ..info('Old style')
    ..config = quill.config.copyWith(
      nameBGColor: CQHIColors.white.bg,
      msgFGColor: CQHIColors.blue.fg,
      tagStyle: CQSTDStyles.underlineOn + CQSTDStyles.italicOn,
    )
    ..info('New style')
    ..turnOffColors()
    ..error('No more colors!')
    ..turnOnColors();
}

void customize() {
  quill
    ..config = quill.config.copyWith(
      nameFGColor: CQColor(222).fg, // set fg color of name to yellow-orange
      nameBGColor: CQSTDColors.defaultBG,
      msgStyle: CQStyle(7), // swap foreground and background colors
    )
    ..info('Custom color & style');
}
