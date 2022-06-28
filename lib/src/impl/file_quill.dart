import 'dart:io';
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as path;

import '../interface/quill.dart';

const _fileName = 'log';
const _firstIndex = 0;
const _zipSuffix = '.zip';
const _maxFileSize = 100000;

// ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
final _fileRegex = RegExp('^$_fileName' + r'\d+' + '(?:$_zipSuffix)?' + r'$');

class FileQuill implements Quill {
  FileQuill(
    this.name, {
    required this.dir,
    this.maxFileSize = _maxFileSize,
  }) : _zip = ZipFileEncoder();

  /// {@macro quick_quotes_quill.Quill.name}
  @override
  final String name;

  /// Path to folder for log files.
  final Directory dir;

  /// Max size of one log file in bytes.
  final int maxFileSize;

  final ZipFileEncoder _zip;

  Directory _zipDir(File file) => Directory('${file.path}$_zipSuffix');

  /// {@macro quick_quotes_quill.Quill.log}
  @override
  void log(Object? msg) => _writeToFile(_format(msg, QuillTag.log));

  /// {@macro quick_quotes_quill.Quill.error}
  @override
  void error(Object? msg) => _writeToFile(_format(msg, QuillTag.error));

  /// {@macro quick_quotes_quill.Quill.info}
  @override
  void info(Object? msg) => _writeToFile(_format(msg, QuillTag.info));

  void _writeToFile(String msg) {
    var maxIndex = _firstIndex;
    for (final file in dir.listSync()) {
      final fileName = path.split(file.path).last;
      if (_fileRegex.firstMatch(fileName) != null) {
        try {
          final index = int.parse(fileName.replaceAll(_fileName, ''));
          maxIndex = max(maxIndex, index);
        } catch (e) {
          //
        }
      }
    }

    var file = File(path.join(dir.path, '$_fileName$maxIndex'));
    while (true) {
      final zipDir = _zipDir(file);
      if (zipDir.existsSync()) {
        file = _createNextFile(file);
      } else {
        if (file.existsSync()) {
          if (file.statSync().size > maxFileSize) {
            _zipFile(file);
            file = _createNextFile(file);
          } else {
            break;
          }
        } else {
          file.createSync(recursive: true);
          break;
        }
      }
    }

    file.writeAsStringSync(msg, mode: FileMode.append);
  }

  void _zipFile(File file) {
    _zip
      ..create(_zipDir(file).path)
      ..addFile(file)
      ..close();

    file.deleteSync();
  }

  File _createNextFile(File file) {
    final p = file.path;
    final index = int.parse(
      p.replaceFirst(path.join(path.dirname(p), _fileName), ''),
    );

    return File(path.join(dir.path, '$_fileName${index + 1}'));
  }

  String _format(Object? msg, QuillTag tag) {
    final fields = [
      '[${DateTime.now()}]',
      name,
      '[${tag.name.toUpperCase()}]',
      '$msg',
    ];

    return '${fields.join(' ')}\n';
  }
}
