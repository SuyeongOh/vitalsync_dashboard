import 'package:flutter/material.dart';

import '../../service/http_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    String? result = await login(userIdController.text);

    if (result != null) {
      // 로그인 성공 시 HomePage로 이동
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // 로그인 실패 시 다이얼로그 표시
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("로그인 실패"),
          content: const Text("회원정보가 없습니다!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              TextField(controller: userIdController, decoration: const InputDecoration(labelText: "ID")),
              TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
