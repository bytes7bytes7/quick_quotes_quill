import 'quill_base.dart';

/// Manager for some quills
abstract class QuillManagerBase extends QuillBase {
  /// initialize manager
  /// this method is asynchronous, because some init operations
  /// can be asynchronous
  Future<void> initialize(List<QuillBase> quills);
}
