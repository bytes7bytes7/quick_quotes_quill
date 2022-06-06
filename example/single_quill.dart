import 'package:quick_quotes_quill/console_quill.dart';

final quill = ConsoleQuill('App');

void main() {
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
