part of 'console_quill.dart';

/// Configuration of [ConsoleQuill] output.
class ConsoleQuillConfig {
  ConsoleQuillConfig({
    required this.timeFGColor,
    required this.nameFGColor,
    required this.logTagFGColor,
    required this.errorTagFGColor,
    required this.infoTagFGColor,
    required this.msgFGColor,
    required this.timeBGColor,
    required this.nameBGColor,
    required this.logTagBGColor,
    required this.errorTagBGColor,
    required this.infoTagBGColor,
    required this.msgBGColor,
    required this.timeStyle,
    required this.nameStyle,
    required this.tagStyle,
    required this.msgStyle,
  });

  final FGCQColor timeFGColor;
  final FGCQColor nameFGColor;
  final FGCQColor logTagFGColor;
  final FGCQColor errorTagFGColor;
  final FGCQColor infoTagFGColor;
  final FGCQColor msgFGColor;

  final BGCQColor timeBGColor;
  final BGCQColor nameBGColor;
  final BGCQColor logTagBGColor;
  final BGCQColor errorTagBGColor;
  final BGCQColor infoTagBGColor;
  final BGCQColor msgBGColor;

  final CQStyle timeStyle;
  final CQStyle nameStyle;
  final CQStyle tagStyle;
  final CQStyle msgStyle;

  ConsoleQuillConfig copyWith({
    FGCQColor? timeFGColor,
    FGCQColor? nameFGColor,
    FGCQColor? logTagFGColor,
    FGCQColor? errorTagFGColor,
    FGCQColor? infoTagFGColor,
    FGCQColor? msgFGColor,
    BGCQColor? timeBGColor,
    BGCQColor? nameBGColor,
    BGCQColor? logTagBGColor,
    BGCQColor? errorTagBGColor,
    BGCQColor? infoTagBGColor,
    BGCQColor? msgBGColor,
    CQStyle? timeStyle,
    CQStyle? nameStyle,
    CQStyle? tagStyle,
    CQStyle? msgStyle,
  }) =>
      ConsoleQuillConfig(
        timeFGColor: timeFGColor ?? this.timeFGColor,
        nameFGColor: nameFGColor ?? this.nameFGColor,
        logTagFGColor: logTagFGColor ?? this.logTagFGColor,
        errorTagFGColor: errorTagFGColor ?? this.errorTagFGColor,
        infoTagFGColor: infoTagFGColor ?? this.infoTagFGColor,
        msgFGColor: msgFGColor ?? this.msgFGColor,
        timeBGColor: timeBGColor ?? this.timeBGColor,
        nameBGColor: nameBGColor ?? this.nameBGColor,
        logTagBGColor: logTagBGColor ?? this.logTagBGColor,
        errorTagBGColor: errorTagBGColor ?? this.errorTagBGColor,
        infoTagBGColor: infoTagBGColor ?? this.infoTagBGColor,
        msgBGColor: msgBGColor ?? this.msgBGColor,
        timeStyle: timeStyle ?? this.timeStyle,
        nameStyle: nameStyle ?? this.nameStyle,
        tagStyle: tagStyle ?? this.tagStyle,
        msgStyle: msgStyle ?? this.msgStyle,
      );
}
