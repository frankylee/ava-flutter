import 'package:ava_flutter/shared/local_storage/view_model/shared_preferences_provider.dart';
import 'package:ava_flutter/shared/mixin/logger_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The [LocalStorageNotifier] interacts with the [SharedPreferencesWithCache]
/// instance. This allows us to manage any data we wish to persist or remove
/// from the device.
class LocalStorageNotifier extends Notifier<void> with LoggerMixin {
  static final provider =
      NotifierProvider<LocalStorageNotifier, void>(LocalStorageNotifier.new);

  @override
  void build() {
    ref.watch(sharedPreferencesProvider);
  }
}
