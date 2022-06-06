import '../interface/quill_base.dart';
import '../interface/quill_manager_base.dart';

const _name = 'Spread Quill Manager';

/// Manager that spreads logs to quills
class SpreadQuillManager implements QuillManagerBase {
  SpreadQuillManager._(this.name);

  static final inst = SpreadQuillManager._(_name);

  @override
  final String name;

  final _quills = <QuillBase>[];

  @override
  Future<void> initialize(List<QuillBase> quills) async =>
      _quills.addAll(quills);

  @override
  void log(Object? msg) {
    for (final quill in _quills) {
      quill.log(msg);
    }
  }

  @override
  void error(Object? msg) {
    for (final quill in _quills) {
      quill.error(msg);
    }
  }

  @override
  void info(Object? msg) {
    for (final quill in _quills) {
      quill.info(msg);
    }
  }
}
