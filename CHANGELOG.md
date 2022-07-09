## 3.0.1

- Changed version of `path` dependency

## 3.0.0

### Breaking Changes

- Renamed `QuillBase` to `Quill`, `QuillManagerBase` to `QuillManager`
- `QuillManager` no longer extends `Quill`
- `AccessQuillManager` no longer has `log`, `error`, `info` methods
- Replaced private constructor of `SpreadQuillManager`, `AccessQuillManager` with public

### Internal

- Added `FileQuill`
- Added exports to barrel files
- Exported `QuillTag`

## 2.0.0

### Breaking Changes

- Changed `ConsoleQuillConfig` interface by replacing `String` fields with `FGCQColor`, `BGCQColor`,
  `CQStyle`
- `AccessQuillManager.quill` does not throw `Exception` anymore. It returns nullable `QuillBase?`

### Internal

- Added `CQEscapeCode` interface and its inheritors: `CQColor`, `CQStyle`
- Added inheritors of `CQColor`: `FGCQColor`, `BGCQColor`
- Added `CQSTDColors`, `CQHIColors`
- Added `CQSTDStyles`
- Changed default config of `ConsoleQuill`
- Gathered all examples in a single file

## 1.1.1

- Added `Grep Console` plugin to README

## 1.1.0

- Added `turnOnColors`, `turnOffColors` to `ConsoleQuill`

## 1.0.0

- Added interfaces: `QuillBase`, `QuillManagerBase`
- Added impl: `ConsoleQuill`, `SpreadQuillManager`, `AccessQuillManager`
