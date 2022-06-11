import '../interface/quill_base.dart';
import '../interface/quill_manager_base.dart';

const _name = 'Spread Quill Manager';

/// Manager that spreads logs to each quill it stores.
class SpreadQuillManager implements QuillManagerBase {
  SpreadQuillManager._(this.name);

  static final inst = SpreadQuillManager._(_name);

  /// {@macro quick_quotes_quill.QuillBase.name}
  @override
  final String name;

  final _quills = <QuillBase>[];

  /// {@macro quick_quotes_quill.QuillManagerBase.initialize}
  @override
  Future<void> initialize(List<QuillBase> quills) async =>
      _quills.addAll(quills);

  /// {@macro quick_quotes_quill.QuillBase.log}
  @override
  void log(Object? msg) {
    for (final quill in _quills) {
      quill.log(msg);
    }
  }

  /// {@macro quick_quotes_quill.QuillBase.error}
  @override
  void error(Object? msg) {
    for (final quill in _quills) {
      quill.error(msg);
    }
  }

  /// {@macro quick_quotes_quill.QuillBase.info}
  @override
  void info(Object? msg) {
    for (final quill in _quills) {
      quill.info(msg);
    }
  }
}
