import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ProfileScreen.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class Stories extends StatefulWidget {
  var loading;
  var updateLoading;

  Stories({Key? key, this.loading, this.updateLoading}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final secureStorage = SecureStorage();

  var users = [];
  var userId = "";

  loadUsers() async {
    var token = await secureStorage.read('token');
    var user = await secureStorage.read('user');

    var usersResponse = await http.get(
        Uri.parse('https://ulker-social-backend.tarikadmin35.repl.co/users'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': '$token'
        });

    if (usersResponse.statusCode == 200) {
      var jsonData = json.decode(usersResponse.body);

      if (mounted) {
        // Check if the widget is still mounted.
        setState(() {
          userId = "$user";
          users = jsonData['users'];
          widget.loading = false;
        });
      }

      if (widget.updateLoading != null) {
        widget.updateLoading!(false);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.loading) {
      loadUsers();
    }
  }

  void didUpdateWidget(Stories oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.loading && !oldWidget.loading) {
      loadUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Container(
        height: 95,
      );
    } else {
      return Container(
        height: 95,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(bottom: BorderSide(color: Colors.black, width: 0.2)),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.loading == false && users.length == 0
              ? [
                  Center(
                    child: const Text("Kullanıcı bulunamadı.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  )
                ]
              : users.map((user) => _buildProfileItem(user)).toList(),
        ),
      );
    }
  }

  Widget _buildProfileItem(user) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () async {
          var result = await Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => ProfileScreen(
                    user: user,
                    myId: userId,
                  )));

          if (result) {
            print("Back to main screen");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: user['_id'],
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(user['pic'] != null
                                ? user['pic']
                                : "https://res.cloudinary.com/doaf7ybhd/image/upload/v1621854139/default-profile.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  user['name'],
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
