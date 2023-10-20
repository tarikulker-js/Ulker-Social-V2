import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ExploreScreen.dart';
import 'package:ulkersocialv2/screens/LoginScreen.dart';
import 'package:ulkersocialv2/screens/MainScreen.dart';
import 'package:ulkersocialv2/screens/ReelsScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final SecureStorage secureStorage = SecureStorage();

  var profile = {};

  _loadProfile() async {
    var profile_ = await secureStorage.read('profile');

    if (profile_ != null && profile_.isNotEmpty) {
      profile_ = profile_.trim();

      var jsonProfile = jsonDecode(profile_);

      setState(() {
        profile = jsonProfile;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("${profile['name']}"),
              accountEmail: Text("${profile['email']}"),
              currentAccountPicture: Container(
                decoration: profile.containsKey('pic') ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage("${profile['pic']}"),
                      fit: BoxFit.cover),
                ) : null,
              ),
            ),
            FloatingActionButton(
              heroTag: "main",
              child: ListTile(
                title: Text("Ana Sayfa"),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) => MainScreen(),
                    ),
                    (router) => false,
                  );
                },
              ),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: "explore",
              child: ListTile(
                title: Text("Keşfet"),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) => ExploreScreen(),
                    ),
                    (router) => false,
                  );
                },
              ),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: "reels",
              child: ListTile(
                title: Text("Reels"),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (BuildContext context) => ReelsScreen(),
                    ),
                  );
                },
              ),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: "logout",
              child: ListTile(
                title: Text("Çıkış Yap"),
                onTap: () {
                  secureStorage.delete('token');
                  secureStorage.delete('user');

                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                    (router) => false,
                  );
                },
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}

/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ChatScreen.dart';
import 'package:ulkersocialv2/screens/LoginScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class MyDrawer extends StatelessWidget implements PreferredSizeWidget {
  final SecureStorage secureStorage = SecureStorage();

  MyDrawer({super.key});

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: secureStorage.read('token'),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // !!! LOADING...
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // !!! ERROR MESSAGE
          return Text('ERROR: ${snapshot.error}');
        } else {
          final String? token = snapshot.data;

          if (token != null && token.isNotEmpty) {
            // !!! Login was logined.
            return Drawer(
                backgroundColor: Theme.of(context).primaryColor,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("Tarık Ülker"),
                      accountEmail: Text("tarik@ulkersoft.com.tr"),
                      currentAccountPicture: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/59295271?v=4"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Çıkış Yap"),
                      onTap: () {
                        secureStorage.delete('token');

                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ),
                          (router) => false,
                        );
                      },
                    ),
                  ],
                ));
          } else {
            return Drawer();
          }
        }
      },
    );
  }
}

*/