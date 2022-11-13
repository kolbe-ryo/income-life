// Package imports:
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    Level.ALL,
    includeCallerInfo: true, // リリースビルドではfalseにする
  )
  ..mode = LoggerMode.log
  ..formatter = (info) => '${info.level} ${info.time} ${info.message}';
