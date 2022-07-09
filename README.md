# Quick-Quotes Quill

Logger package.

## Features

Create your own implementations of `Quill`. Manage all your quills with `QuillManager`. This package
has some implementations: `ConsoleQuill`, `FileQuill`, `SpreadQuillManager` and `AccessQuillManager`
.

## Colors

Note that IDEs: VSCode, XCode, Android Studio, IntelliJ do NOT support ANSI escape sequences (that
are used to colorize output) in their terminal outputs.

If you are using a JetBrains IDE (Android Studio, IntelliJ, etc.) you can use
[Grep Console Plugin](https://plugins.jetbrains.com/plugin/7125-grep-console). To do that follow the
steps:

- turn off colors and styles

```dart

final quill = ConsoleQuill('App')
  ..turnOffColors()
  ..turnOffStyles();
```

- install `Grep Console Plugin`
- configure the plugin like that

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/grep_console.png">

### Grep Console configuration

Regex:

- `[\w ]+(?= \[(INFO|ERROR|LOG)\])` - for a quill's name
- `\[ERROR\]` - for error
- `\[LOG\]` - for log
- `\[INFO\]` - for info
- `\[\d{4}(?:-\d{2}){2} (?:\d{2}:){2}\d{2}.\d{6}\]` - for DateTime

Colors:

- `28928F` - for a quill's name
- `F2188E` - for error
- `9BB822` - for log
- `528CDA` - for info
- `808080` - for DateTime

New versions of Android Studio (for exp. 2021.2.1) DO support ANSI escape sequences (that are used
to colorize output) in terminal outputs.

## Usage

You can use 1-2 loggers for a small project. Create new quill as a top-level variable.

```dart
import 'package:quick_quotes_quill/console_quill.dart';

final quill = ConsoleQuill('Single');
```

Quill has 3 functions: log, error, message.

```dart
void singleQuill() {
  divide(10, 5);
}

double divide(int a, int b) {
  if (b == 0) {
    quill.error('$b can not be 0');
    throw Exception('Zero division');
  }

  quill.info('b != 0');

  final r = a / b;
  quill.log('$a / $b = $r');

  return r;
}
```

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/single_quill.png">

Also you can use `FileQuill` to store your logs in file. This quill allows use to specify directory
and the max size of each log file. When a file reaches size limit, `FileQuill` archives it and
create a new one.

```dart
import 'dart:io';

import 'package:quick_quotes_quill/file_quill.dart';

void fileQuill() {
  FileQuill('File Quill', dir: Directory.current)
    ..info('Some information')
    ..log('Simple message');
}

```

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/file_quill.png">

If you have multiple quills, then you can manage them with `SpreadQuillManager`
or create your own implementation of `QuillManager`.

```dart
import 'package:quick_quotes_quill/all.dart';

void spreadQuillManger() {
  SpreadQuillManager('Test manager')
    ..initialize([
      ConsoleQuill('Quill A'),
      ConsoleQuill('Quill B'),
    ])
    ..info('There are 2 quills')
    ..log('Nothing interesting')
    ..error('Something is wrong...');
}
```

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/spread_manager.png">

Also you can use `AccessQuillManager` to access certain quill.

```dart
import 'package:quick_quotes_quill/all.dart';

void accessQuillManager() {
  final quillManager = AccessQuillManager('Test manager')
    ..initialize([
      ConsoleQuill('Quill A'),
      ConsoleQuill('Quill B'),
    ]);

  final quillB = quillManager.quill('Quill B');
  if (quillB != null) {
    quillB.info('I am here!');

    final quillX = quillManager.quill('Quill X');
    if (quillX == null) {
      quillB.error('"Quill X" does not exist');
    }
  }
}
```

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/access_manager.png">

You can customize `ConsoleQuill`.

```dart
import 'package:quick_quotes_quill/console_quill.dart';

final quill = ConsoleQuill('Single');

void customize() {
  quill
    ..info('Old style')
    ..config = quill.config.copyWith(
      nameBGColor: CQHIColors.white.bg,
      msgFGColor: CQHIColors.blue.fg,
      tagStyle: CQSTDStyles.underlineOn + CQSTDStyles.italicOn,
    )
    ..info('New style')
    ..turnOffColors()
    ..error('No more colors!');
}
```

<img src="https://raw.githubusercontent.com/bytes7bytes7/quick_quotes_quill/master/screenshots/customize.png">