import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'reset_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _loginError;
  String? _passwordError;

  void _handleSignIn() {
    setState(() {
      _loginError = _loginController.text.isEmpty ? 'Поле обов’язкове для заповнення' : null;
      _passwordError = _passwordController.text.isEmpty ? 'Поле обов’язкове для заповнення' : null;
    });

    if (_loginError == null && _passwordError == null) {
      // Успішна валідація
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Авторизація успішна!')),
      );
    } else {
      // Вимога прикладу
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Need to implement: Заповніть усі поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизація'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_person, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 32),
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    labelText: 'Логін або Ел. пошта',
                    prefixIcon: const Icon(Icons.person),
                    errorText: _loginError, // Виведення помилки валідації
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: const Icon(Icons.lock),
                    errorText: _passwordError, // Виведення помилки валідації
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSignIn,
                  child: const Text('Увійти'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                  child: const Text('Забули пароль?'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Немає акаунта?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text('Зареєструватися'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}