import 'package:quick_quotes_quill/access_quill_manager.dart';
import 'package:quick_quotes_quill/console_quill.dart';

void main() {
  AccessQuillManager.inst.initialize([
    ConsoleQuill('Quill A'),
    ConsoleQuill('Quill B'),
  ]);

  AccessQuillManager.inst.quill('Quill B').info('I am here!');
  try {
    AccessQuillManager.inst.quill('Quill X').info('I do not exist');
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
