/// Interface for quill
abstract class QuillBase {
  /// Quill name
  String get name;

  /// For usual message
  void log(Object? msg);

  /// For error message
  void error(Object? msg);

  /// For important message
  void info(Object? msg);
}
