import 'package:hive/hive.dart';

class AppState {
  static final Box _box = Hive.box('appBox');

  // Ключи
  static const String _onboardingKey = 'onboarding_completed';
  static const String _isLoggedInKey = 'is_logged_in';

  // Онбординг
  static bool get onboardingCompleted =>
      _box.get(_onboardingKey, defaultValue: false) as bool;
  static Future<void> completeOnboarding() => _box.put(_onboardingKey, true);

  // Авторизация
  static bool get isLoggedIn =>
      _box.get(_isLoggedInKey, defaultValue: false) as bool;
  static Future<void> login() => _box.put(_isLoggedInKey, true);
  static Future<void> logout() => _box.put(_isLoggedInKey, false);
}
