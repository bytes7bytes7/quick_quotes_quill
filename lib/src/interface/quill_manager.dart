import 'quill.dart';

/// Manager for some quills.
abstract class QuillManager {
  /// {@template quick_quotes_quill.QuillManager.name}
  /// QuillManager name.
  /// {@endtemplate}
  String get name;

  /// {@template quick_quotes_quill.QuillManager.initialize}
  /// This method registers quills in this manager.
  ///
  /// Call this method first in the main function.
  ///
  /// It is asynchronous, because some init operations
  /// can have a Future type.
  /// {@endtemplate}
  Future<void> initialize(List<Quill> quills);
}
