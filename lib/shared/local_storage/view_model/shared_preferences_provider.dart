import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The [sharedPreferencesProvider] is intitialized before the app in `main.dart`
/// with a provider override. This ensures we can use SharedPreferences anywhere
/// in the application.
final sharedPreferencesProvider = Provider<SharedPreferencesWithCache>((ref) {
  throw UnimplementedError();
});
