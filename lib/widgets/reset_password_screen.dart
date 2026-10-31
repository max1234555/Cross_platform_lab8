import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _loginController = TextEditingController();
  String? _loginError;

  void _handleReset() {
    setState(() {
      _loginError = _loginController.text.isEmpty ? 'Поле не може бути порожнім' : null;
    });

    if (_loginError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Інструкції надіслано!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Need to implement: Введіть логін або пошту')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Відновлення паролю'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_reset, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 16),
                const Text(
                  'Введіть логін або пошту для відновлення доступу',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    labelText: 'Логін або Ел. пошта',
                    prefixIcon: const Icon(Icons.person_outline),
                    errorText: _loginError,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleReset,
                  child: const Text('Скинути пароль'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Повернутися назад'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}