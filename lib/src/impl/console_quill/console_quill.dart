// ignore_for_file: avoid_print

import '../../interface/quill_base.dart';
import 'color_style/color_style.dart';
import 'quill_tag.dart';

part 'console_quill_config.dart';

/// Quill that prints logs via [print].
class ConsoleQuill implements QuillBase {
  ConsoleQuill(this.name);

  /// {@macro quick_quotes_quill.QuillBase.name}
  @override
  final String name;

  bool _useColors = true;

  /// Configuration of quill output.
  ConsoleQuillConfig config = ConsoleQuillConfig(
    timeFGColor: CQSTDColors.defaultFG,
    nameFGColor: CQSTDColors.cyan.fg,
    logTagFGColor: CQSTDColors.green.fg,
    errorTagFGColor: CQSTDColors.red.fg,
    infoTagFGColor: CQSTDColors.blue.fg,
    msgFGColor: CQSTDColors.defaultFG,
    timeBGColor: CQSTDColors.defaultBG,
    nameBGColor: CQSTDColors.defaultBG,
    logTagBGColor: CQSTDColors.defaultBG,
    errorTagBGColor: CQSTDColors.defaultBG,
    infoTagBGColor: CQSTDColors.defaultBG,
    msgBGColor: CQSTDColors.defaultBG,
    timeStyle: CQSTDStyles.normal,
    nameStyle: CQSTDStyles.boldOn,
    tagStyle: CQSTDStyles.normal,
    msgStyle: CQSTDStyles.normal,
  );

  /// {@macro quick_quotes_quill.QuillBase.log}
  ///
  /// Print [msg] with [QuillTag.log] tag.
  @override
  void log(Object? msg) => print(_format(msg, QuillTag.log));

  /// {@macro quick_quotes_quill.QuillBase.error}
  ///
  /// Print [msg] with [QuillTag.error] tag.
  @override
  void error(Object? msg) => print(_format(msg, QuillTag.error));

  /// {@macro quick_quotes_quill.QuillBase.info}
  ///
  /// Print [msg] with [QuillTag.info] tag.
  @override
  void info(Object? msg) => print(_format(msg, QuillTag.info));

  /// Resume using colors in output.
  void turnOnColors() => _useColors = true;

  /// Stop using colors in output.
  void turnOffColors() => _useColors = false;

  String _format(Object? msg, QuillTag tag) {
    final fields = <String>[
      '${DateTime.now()}',
      name,
      tag.name.toUpperCase(),
      '$msg'
    ];

    if (_useColors) {
      var tagColor = CQSTDColors.defaultFG;
      switch (tag) {
        case QuillTag.log:
          tagColor = config.logTagFGColor;
          break;
        case QuillTag.error:
          tagColor = config.errorTagFGColor;
          break;
        case QuillTag.info:
          tagColor = config.infoTagFGColor;
          break;
      }

      return '${CQSTDStyles.normal}'
          '${config.timeStyle}${config.timeFGColor}[${fields[0]}]'
          '${CQSTDStyles.normal} '
          '${config.nameStyle}${config.nameFGColor}${fields[1]}'
          '${CQSTDStyles.normal} '
          '${config.tagStyle}$tagColor[${fields[2]}]'
          '${CQSTDStyles.normal} '
          '${config.msgStyle}${config.msgFGColor}${fields[3]}'
          '${CQSTDStyles.normal}';
    }

    return '[${fields[0]}] '
        '${fields[1]} '
        '[${fields[2]}] '
        '${fields[3]}';
  }
}
