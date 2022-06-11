import 'quill_base.dart';

/// Manager for some quills.
abstract class QuillManagerBase extends QuillBase {
  /// {@template quick_quotes_quill.QuillManagerBase.initialize}
  /// This method registers quills in this manager.
  ///
  /// Call this method first in the main function.
  ///
  /// It is asynchronous, because some init operations
  /// can have a Future type.
  /// {@endtemplate}
  Future<void> initialize(List<QuillBase> quills);
}
