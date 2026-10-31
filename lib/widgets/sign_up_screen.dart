import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  void _handleSignUp() {
    setState(() {
      _nameError = _nameController.text.isEmpty ? 'Введіть ім’я' : null;
      _emailError = _emailController.text.isEmpty ? 'Введіть пошту' : null;
      _passwordError = _passwordController.text.isEmpty ? 'Введіть пароль' : null;
    });

    if (_nameError == null && _emailError == null && _passwordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Реєстрація успішна!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Need to implement: Заповніть усі поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Реєстрація'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Створити акаунт',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Ім’я користувача',
                    prefixIcon: const Icon(Icons.badge),
                    errorText: _nameError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Електронна пошта',
                    prefixIcon: const Icon(Icons.email),
                    errorText: _emailError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: const Icon(Icons.lock),
                    errorText: _passwordError,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSignUp,
                  child: const Text('Зареєструватися'),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Вже є акаунт? Увійти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}