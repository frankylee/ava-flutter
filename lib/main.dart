import 'dart:developer';

import 'package:ava_flutter/app/ava.dart';
import 'package:ava_flutter/shared/local_storage/model/local_storage_key.enum.dart';
import 'package:ava_flutter/shared/local_storage/view_model/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
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

  // Lock the app to using only portrait modes.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize SharedPreferences.
  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: <String>{
        LocalStorageKey.employer.value,
        LocalStorageKey.employerAddress.value,
        LocalStorageKey.employmentDurationMonth.value,
        LocalStorageKey.employmentDurationYear.value,
        LocalStorageKey.employmentType.value,
        LocalStorageKey.grossAnnual.value,
        LocalStorageKey.isDirectDeposit.value,
        LocalStorageKey.jobTitle.value,
        LocalStorageKey.nextPayDate.value,
        LocalStorageKey.payFrequency.value,
      },
    ),
  );

  // Run application with Riverpod by wrapping the app in ProviderScope.
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const Ava(),
    ),
  );
}
