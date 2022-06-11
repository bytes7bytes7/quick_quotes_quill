import 'cq_escape_code.dart';

class CQStyle extends CQEscapeCode {
  const CQStyle(super.value);

  @override
  String toString() => '\x1b[${super.toString()}';
}
