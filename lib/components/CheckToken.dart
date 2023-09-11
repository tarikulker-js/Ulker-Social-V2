import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/screens/LoginScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

void _checkToken(context) async {
  final secureStorage = SecureStorage();
  final token = await secureStorage.read('token');

  if (token != null && token.isNotEmpty) {
    final verifyTokenResponse = await http.get(
        Uri.parse(
            'https://ulker-social-backend.tarikadmin35.repl.co/protected'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': "$token"
        });

    if (verifyTokenResponse.statusCode == 401) {
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (BuildContext context) => LoginScreen()),
          (router) => false);
    }
  }
}
