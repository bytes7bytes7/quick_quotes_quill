/// It determines the type of log.
enum QuillTag {
  log,
  error,
  info,
}

/// Quill interface.
abstract class Quill {
  /// {@template quick_quotes_quill.Quill.name}
  /// Quill name.
  /// {@endtemplate}
  String get name;

  /// {@template quick_quotes_quill.Quill.log}
  /// For usual message.
  /// {@endtemplate}
  void log(Object? msg);

  /// {@template quick_quotes_quill.Quill.error}
  /// For error message.
  /// {@endtemplate}
  void error(Object? msg);

  /// {@template quick_quotes_quill.Quill.info}
  /// For important message.
  /// {@endtemplate}
  void info(Object? msg);
}
