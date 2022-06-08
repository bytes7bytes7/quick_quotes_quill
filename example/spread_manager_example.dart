import 'package:quick_quotes_quill/console_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

void main() {
  SpreadQuillManager.inst.initialize([
    ConsoleQuill('Quill A'),
    ConsoleQuill('Quill B'),
  ]);

  SpreadQuillManager.inst
    ..info('There are 2 quills')
    ..log('Nothing interesting')
    ..error('Something is wrong...');
}
