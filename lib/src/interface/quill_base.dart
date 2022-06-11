/// Interface for quill.
abstract class QuillBase {
  /// {@template quick_quotes_quill.QuillBase.name}
  /// Quill name.
  /// {@endtemplate}
  String get name;

  /// {@template quick_quotes_quill.QuillBase.log}
  /// For usual message.
  /// {@endtemplate}
  void log(Object? msg);

  /// {@template quick_quotes_quill.QuillBase.error}
  /// For error message.
  /// {@endtemplate}
  void error(Object? msg);

  /// {@template quick_quotes_quill.QuillBase.info}
  /// For important message.
  /// {@endtemplate}
  void info(Object? msg);
}
