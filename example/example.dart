import 'dart:io';

import 'package:quick_quotes_quill/all.dart';

void main() {
  singleQuill();
  fileQuill();
  spreadQuillManger();
  accessQuillManager();
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

void customize() {
  quill
    ..info('Old style')
    ..config = quill.config.copyWith(
      nameBGColor: CQHIColors.white.bg,
      msgFGColor: CQHIColors.blue.fg,
      tagStyle: CQSTDStyles.underlineOn + CQSTDStyles.italicOn,
    )
    ..info('New style')
    ..turnOffColors()
    ..error('No more colors!');
}
