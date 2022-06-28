import '../interface/quill.dart';
import '../interface/quill_manager.dart';

/// Manager that provides a certain quill.
class AccessQuillManager implements QuillManager {
  AccessQuillManager(this.name);

  /// {@macro quick_quotes_quill.Quill.name}
  @override
  final String name;

  final _quills = <String, Quill>{};
  var _initialized = false;

  /// {@macro quick_quotes_quill.QuillManager.initialize}
  @override
  Future<void> initialize(List<Quill> quills) async {
    if (_initialized) {
      throw Exception('$runtimeType has already been initialized');
    }

    for (final quill in quills) {
      _quills[quill.name] = quill;
    }

    _initialized = true;
  }

  /// Provide a quill by its name.
  Quill? quill(String name) => _quills[name];
}
