import '../interface/quill_base.dart';
import '../interface/quill_manager_base.dart';

const _name = 'Access Quill Manager';

/// Manager that provides certain quill
class AccessQuillManager implements QuillManagerBase {
  AccessQuillManager._(this.name);

  static final inst = AccessQuillManager._(_name);

  @override
  final String name;

  final _quills = <String, QuillBase>{};

  @override
  Future<void> initialize(List<QuillBase> quills) async {
    for (final quill in quills) {
      _quills[quill.name] = quill;
    }
  }

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
