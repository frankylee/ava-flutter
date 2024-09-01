import 'package:logging/logging.dart';

/// The [LoggerMixin] extends a class with an accessible [Logger] for reporting.
mixin LoggerMixin {
  Logger get logger => Logger(runtimeType.toString());
}
