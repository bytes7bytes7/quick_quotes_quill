import '../interface/quill.dart';
import '../interface/quill_manager.dart';

/// Manager that spreads logs to each quill it stores.
class SpreadQuillManager implements QuillManager {
  SpreadQuillManager(this.name);

  /// {@macro quick_quotes_quill.QuillManager.name}
  @override
  final String name;

  final _quills = <Quill>[];
  var _initialized = false;

  /// {@macro quick_quotes_quill.QuillManager.initialize}
  @override
  Future<void> initialize(List<Quill> quills) async {
    if (_initialized) {
      throw Exception('$runtimeType has already been initialized');
    }

    _quills.addAll(quills);
    _initialized = true;
  }

  /// {@macro quick_quotes_quill.Quill.log}
  void log(Object? msg) {
    for (final quill in _quills) {
      quill.log(msg);
    }
  }

  /// {@macro quick_quotes_quill.Quill.error}
  void error(Object? msg) {
    for (final quill in _quills) {
      quill.error(msg);
    }
  }

  /// {@macro quick_quotes_quill.Quill.info}
  void info(Object? msg) {
    for (final quill in _quills) {
      quill.info(msg);
    }
  }
}
