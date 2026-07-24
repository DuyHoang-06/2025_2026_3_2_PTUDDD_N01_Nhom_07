import '../models/user.dart';
import '../data/fake_user.dart';

class AuthService {
  static Future<User?> login(String email, String password) async {
    // giả lập gọi server
    await Future.delayed(const Duration(seconds: 1));

    for (var account in fakeUsers) {
      if (account["email"] == email.trim() &&
          account["password"] == password.trim()) {
        return account["user"] as User;
      }
    }

    return null;
  }
}
