// ignore_for_file: avoid_print

import '../../interface/quill_base.dart';
import 'cq_colors.dart';
import 'cq_styles.dart';
import 'quill_tag.dart';

part 'console_quill_config.dart';

/// Quill that prints logs via `print`
class ConsoleQuill implements QuillBase {
  ConsoleQuill(this.name);

  @override
  final String name;

  ConsoleQuillConfig config = ConsoleQuillConfig(
    timeColor: CQColors.startUp,
    nameColor: CQColors.cyan,
    logTagColor: CQColors.green,
    errorTagColor: CQColors.red,
    infoTagColor: CQColors.blue,
    msgColor: CQColors.startUp,
    timeStyle: CQStyles.noStyle,
    nameStyle: CQStyles.boldOn,
    tagStyle: CQStyles.noStyle,
    msgStyle: CQStyles.noStyle,
  );

  @override
  void log(Object? msg) => print(_format(msg, QuillTag.log));

  @override
  void error(Object? msg) => print(_format(msg, QuillTag.error));

  @override
  void info(Object? msg) => print(_format(msg, QuillTag.info));

  String _format(Object? msg, QuillTag tag) {
    var tagColor = '';
    switch (tag) {
      case QuillTag.log:
        tagColor = config.logTagColor;
        break;
      case QuillTag.error:
        tagColor = config.errorTagColor;
        break;
      case QuillTag.info:
        tagColor = config.infoTagColor;
        break;
    }

    return '[${config.timeStyle}${config.timeColor}${DateTime.now()}]${CQStyles.noStyle} '
        '${config.nameStyle}${config.nameColor}$name${CQStyles.noStyle} '
        '${config.tagStyle}$tagColor[${tag.name.toUpperCase()}]${CQStyles.noStyle} '
        '${config.msgStyle}${config.msgColor}$msg';
  }
}
