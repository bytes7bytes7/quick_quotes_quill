import '../interface/quill_base.dart';
import '../interface/quill_manager_base.dart';

const _name = 'Access Quill Manager';

/// Manager that provides a certain quill.
class AccessQuillManager implements QuillManagerBase {
  AccessQuillManager._(this.name);

  static final inst = AccessQuillManager._(_name);

  /// {@macro quick_quotes_quill.QuillBase.name}
  @override
  final String name;

  final _quills = <String, QuillBase>{};

  /// {@macro quick_quotes_quill.QuillManagerBase.initialize}
  @override
  Future<void> initialize(List<QuillBase> quills) async {
    for (final quill in quills) {
      _quills[quill.name] = quill;
    }
  }

  /// Provide a quill by its name.
  QuillBase quill(String name) {
    final q = _quills[name];
    if (q != null) {
      return q;
    }

    throw Exception('No quill with name "$name"');
  }

  @Deprecated('Use `quill` method instead')
  @override
  void log(Object? msg) {}

  @Deprecated('Use `quill` method instead')
  @override
  void error(Object? msg) {}

  @Deprecated('Use `quill` method instead')
  @override
  void info(Object? msg) {}
}
