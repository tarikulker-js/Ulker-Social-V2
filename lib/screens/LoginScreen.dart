import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/Drawer.dart';
import 'package:ulkersocialv2/screens/MainScreen.dart';
import 'package:ulkersocialv2/screens/RegisterScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final secureStorage = SecureStorage();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (BuildContext context) => MainScreen()),
        (router) => false);
  }

  void _login() async {
    setState(() {
      isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    final response = await http.post(
      Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/signin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200 && json.decode(response.body)["error"] == null) {
      var profileResponse = await http.get(
          Uri.parse(
              'https://ulker-social-backend.tarikadmin35.repl.co/profile'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': '${json.decode(response.body)["token"]}'
          });

      await secureStorage.write('token', json.decode(response.body)['token']);
      await secureStorage.write('user', json.decode(response.body)['user']);

      if (profileResponse.statusCode == 200) {
        var user = json.decode(profileResponse.body)['user'];
        
        await secureStorage.write('profile', jsonEncode(user));
      }

      setState(() {
        isLoading = false;
      });

      navigateToHome();
    } else {
      // ! Hatalı giriş durumunu burada işleyebilirsiniz.
      setState(() {
        isLoading = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Hata"),
          content: Text(json.decode(response.body)["error"] != null ? json.decode(response.body)["error"] : "Kullanıcı adı veya şifre yanlış."),
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

  void _checkToken() async {
    setState(() {
      isLoading = true;
    });

    final token = await secureStorage.read('token');

    if (token != null && token.isNotEmpty) {
      final verifyTokenResponse = await http.get(
          Uri.parse(
              'https://ulker-social-backend.tarikadmin35.repl.co/protected'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': "$token"
          });

      setState(() {
        isLoading = false;
      });

      if (verifyTokenResponse.statusCode != 401) {
        navigateToHome();
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: isLoading ? Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              readOnly: isLoading,
              keyboardType: TextInputType.emailAddress,
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
              readOnly: isLoading,
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
              onPressed: isLoading ? () {} : _login,
              child: Text(isLoading ? "Yükleniyor" : "Giriş Yap"),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  if (isLoading == false) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => RegisterScreen()));
                  }
                },
                child: Text("Hesabınız yok mu? Kayıt olun!"),
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
