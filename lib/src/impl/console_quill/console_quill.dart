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
  bool _useStyles = true;

  /// Configuration of quill output.
  ConsoleQuillConfig config = ConsoleQuillConfig(
    timeFGColor: CQSTDColors.white.fg,
    nameFGColor: CQHIColors.cyan.fg,
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

  /// Resume using styles in output.
  void turnOnStyles() => _useStyles = true;

  /// Stop using styles in output.
  void turnOffStyles() => _useStyles = false;

  String _format(Object? msg, QuillTag tag) {
    final fields = [
      '[${DateTime.now()}]',
      name,
      '[${tag.name.toUpperCase()}]',
      '$msg',
    ];

    final parts = List.generate(fields.length, (index) => StringBuffer());

    if (_useStyles) {
      final styles = [
        config.timeStyle,
        config.nameStyle,
        config.tagStyle,
        config.msgStyle,
      ];

      for (var i = 0; i < fields.length; i++) {
        parts[i].write(styles[i]);
      }
    }

    if (_useColors) {
      final fgColors = [
        config.timeFGColor,
        config.nameFGColor,
        '',
        config.msgFGColor,
      ];
      final bgColors = [
        config.timeBGColor,
        config.nameBGColor,
        '',
        config.msgBGColor,
      ];

      var tagFGColor = CQSTDColors.defaultFG;
      var tagBGColor = CQSTDColors.defaultBG;
      switch (tag) {
        case QuillTag.log:
          tagFGColor = config.logTagFGColor;
          tagBGColor = config.logTagBGColor;
          break;
        case QuillTag.error:
          tagFGColor = config.errorTagFGColor;
          tagBGColor = config.errorTagBGColor;
          break;
        case QuillTag.info:
          tagFGColor = config.infoTagFGColor;
          tagBGColor = config.infoTagBGColor;
          break;
      }

      fgColors[2] = tagFGColor;
      bgColors[2] = tagBGColor;

      for (var i = 0; i < fields.length; i++) {
        parts[i].write(fgColors[i]);
        parts[i].write(bgColors[i]);
      }
    }

    for (var i = 0; i < fields.length; i++) {
      parts[i].write(fields[i]);
    }

    return '${parts.map((e) => '$e').join('${CQSTDStyles.normal} ')}'
        '${CQSTDStyles.normal}';
  }
}
