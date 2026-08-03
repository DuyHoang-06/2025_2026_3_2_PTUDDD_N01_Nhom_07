import 'package:flutter/material.dart';
import '../models/user.dart';

/// Singleton lưu trữ thông tin user đang đăng nhập.
/// Đặt trong session sau khi login thành công.
class AuthSession extends ChangeNotifier {
  AuthSession._();
  static final AuthSession instance = AuthSession._();

  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  void login(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void updateProfile({String? name, String? email, String? avatar}) {
    if (_currentUser == null) return;
    _currentUser = User(
      id: _currentUser!.id,
      name: name ?? _currentUser!.name,
      email: email ?? _currentUser!.email,
      avatar: avatar ?? _currentUser!.avatar,
    );
    notifyListeners();
  }
}

/// Tiện ích: lấy AuthSession qua InheritedNotifier.
/// Widget con gọi AuthSessionContext.watch(context) sẽ rebuild khi
/// user đăng nhập / đăng xuất.
class AuthSessionScope extends InheritedNotifier<AuthSession> {
  const AuthSessionScope({
    super.key,
    required AuthSession super.notifier,
    required super.child,
  });

  static AuthSession of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AuthSessionScope>();
    return scope?.notifier ?? AuthSession.instance;
  }
}