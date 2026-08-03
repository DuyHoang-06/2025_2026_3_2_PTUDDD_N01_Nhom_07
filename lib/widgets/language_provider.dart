import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';

/// Quản lý ngôn ngữ hiện tại của toàn app.
///
/// Cách dùng:
/// ```dart
/// final tr = LanguageProvider.t(context);
/// Text(tr.text('login_button'));   // "Đăng Nhập" hoặc "Sign In"
///
/// // Đổi ngôn ngữ
/// LanguageProvider.of(context).setLocale('en');
/// ```
class LanguageProvider extends ChangeNotifier {
  static final LanguageProvider instance = LanguageProvider._();
  LanguageProvider._();
  LanguageProvider({String initial = 'vi'}) : _locale = initial;

  String _locale = 'vi';

  String get locale => _locale;

  AppTranslations get translations => AppTranslations(_locale);

  void setLocale(String newLocale) {
    if (newLocale == _locale) return;
    if (!AppTranslations.supportedLocales.contains(newLocale)) return;
    _locale = newLocale;
    notifyListeners();
  }

  void toggle() {
    setLocale(_locale == 'vi' ? 'en' : 'vi');
  }

  /// Lấy instance LanguageProvider.
  /// Widget gọi hàm này sẽ tự động rebuild khi locale đổi
  /// (vì `LanguageScope` là InheritedNotifier).
  static LanguageProvider of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LanguageScope>();
    return scope?.notifier ?? instance;
  }

  /// Truy cập nhanh AppTranslations.
  static AppTranslations t(BuildContext context) {
    return of(context).translations;
  }
}

/// InheritedNotifier tự động thông báo cho widget con khi locale đổi.
///
/// Cách Flutter xử lý `InheritedNotifier`:
/// - Mỗi widget gọi `context.dependOnInheritedWidgetOfExactType<LanguageScope>()`
///   sẽ được đăng ký như một dependency.
/// - Khi `notifier.notifyListeners()` được gọi, Flutter tự động rebuild
///   tất cả widget phụ thuộc.
/// - Đường rebuild đi qua `Element.updateChild` nên widget con được
///   rebuild ĐẦY ĐỦ (kể cả khi nằm trong Navigator route khác).
class LanguageScope extends InheritedNotifier<LanguageProvider> {
  const LanguageScope({
    super.key,
    required LanguageProvider super.notifier,
    required super.child,
  });
}