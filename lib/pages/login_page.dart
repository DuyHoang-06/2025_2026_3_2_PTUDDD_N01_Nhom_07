import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/auth_session.dart';
import '../widgets/language_provider.dart';
import 'main_page.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final tr = LanguageProvider.t(context);
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

                            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffEAF8EE),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.kitchen, color: Colors.green, size: 34),
              ),

              const SizedBox(height: 28),

              Text(
                tr.text('login_welcome'),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                tr.text('login_subtitle'),
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 35),

              Text(
                tr.text('login_label_email'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: tr.text('login_email_hint'),
                  filled: true,
                  fillColor: const Color(0xffF3F7F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                tr.text('login_label_password'),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: tr.text('login_password_hint'),
                  filled: true,
                  fillColor: const Color(0xffF3F7F3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print('clicked quên mật khẩu');
                  },
                  child: Text(
                    tr.text('login_forgot'),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () async {
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");
                    final user = await AuthService.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (user != null) {
                      AuthSession.instance.login(user);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(tr.text('login_error_invalid'))),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    tr.text('login_button'),
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 35),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tr.text('login_no_account'),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RegisterPage()),
                        );
                      },
                      child: Text(
                        tr.text('login_register'),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
