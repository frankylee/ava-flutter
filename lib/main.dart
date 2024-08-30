import 'dart:developer';

import 'package:ava_flutter/app/ava.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Logging package.
  Logger.root.level = Level.CONFIG;
  Logger.root.onRecord.listen((record) {
    final dateFormatter = DateFormat.jms();
    log(
      '[${dateFormatter.format(record.time)}] ${record.message}',
      level: record.level.value,
      name: record.loggerName,
      time: record.time,
    );
  });
  final logger = Logger('Ava');

  // Handle all Flutter framework errors.
  FlutterError.onError = ((details) {
    if (details.silent) return;
    logger.severe(
      '[Flutter Error] ${details.exceptionAsString()}',
      details.exception,
      details.stack,
    );
  });

  // Handle all Platform errors not caught by the framework.
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.severe('[Platform Dispatcher Error] $error', error, stack);
    return true;
  };

  // Run application with Riverpod by wrapping the app in ProviderScope.
  runApp(
    const ProviderScope(
      child: Ava(),
    ),
  );
}
