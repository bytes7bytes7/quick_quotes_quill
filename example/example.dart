import 'package:quick_quotes_quill/access_quill_manager.dart';
import 'package:quick_quotes_quill/console_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

void main() {
  singleQuill();
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

void spreadQuillManger() {
  SpreadQuillManager.inst.initialize([
    ConsoleQuill('Quill A'),
    ConsoleQuill('Quill B'),
  ]);

  SpreadQuillManager.inst
    ..info('There are 2 quills')
    ..log('Nothing interesting')
    ..error('Something is wrong...');
}

void accessQuillManager() {
  AccessQuillManager.inst.initialize([
    ConsoleQuill('Quill A'),
    ConsoleQuill('Quill B'),
  ]);

  final quillB = AccessQuillManager.inst.quill('Quill B');
  if (quillB != null) {
    quillB.info('I am here!');

    final quillX = AccessQuillManager.inst.quill('Quill X');
    if (quillX == null) {
      quillB.error('"Quill X" do not exist');
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
