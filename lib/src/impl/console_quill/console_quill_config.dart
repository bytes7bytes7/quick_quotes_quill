part of 'console_quill.dart';

class ConsoleQuillConfig {
  ConsoleQuillConfig({
    required this.timeColor,
    required this.nameColor,
    required this.logTagColor,
    required this.errorTagColor,
    required this.infoTagColor,
    required this.msgColor,
    required this.timeStyle,
    required this.nameStyle,
    required this.tagStyle,
    required this.msgStyle,
  });

  final String timeColor;
  final String nameColor;
  final String logTagColor;
  final String errorTagColor;
  final String infoTagColor;
  final String msgColor;
  final String timeStyle;
  final String nameStyle;
  final String tagStyle;
  final String msgStyle;

  ConsoleQuillConfig copyWith({
    String? timeColor,
    String? nameColor,
    String? logTagColor,
    String? errorTagColor,
    String? infoTagColor,
    String? msgColor,
    String? timeStyle,
    String? nameStyle,
    String? tagStyle,
    String? msgStyle,
  }) =>
      ConsoleQuillConfig(
        timeColor: timeColor ?? this.timeColor,
        nameColor: nameColor ?? this.nameColor,
        logTagColor: logTagColor ?? this.logTagColor,
        errorTagColor: errorTagColor ?? this.errorTagColor,
        infoTagColor: infoTagColor ?? this.infoTagColor,
        msgColor: msgColor ?? this.msgColor,
        timeStyle: timeStyle ?? this.timeStyle,
        nameStyle: nameStyle ?? this.nameStyle,
        tagStyle: tagStyle ?? this.tagStyle,
        msgStyle: msgStyle ?? this.msgStyle,
      );
}
