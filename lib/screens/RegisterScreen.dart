import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/Drawer.dart';
import 'package:ulkersocialv2/screens/MainScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final secureStorage = SecureStorage();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    final response = await http.post(
      Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/signup"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    } else {
      // ! Hatalı giriş durumunu burada işleyebilirsiniz.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Hata"),
          content: Text("Kullanıcı adı veya şifre yanlış."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              cursorColor: Colors.white,
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0)),
                labelText: "İsim Soyisim",
                labelStyle: const TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _emailController,
              cursorColor: Colors.white,
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0)),
                labelText: "E-Posta",
                labelStyle: const TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _passwordController,
              cursorColor: Colors.white,
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                labelText: "Şifreniz",
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Kayıt Ol"),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Hasabın var mı, giriş yap!"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
