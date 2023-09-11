import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ChatScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SecureStorage secureStorage = SecureStorage();

  MyAppBar({super.key});

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
            return AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                "Ulker Social V2",
                style: TextStyle(fontSize: 20),
              ),
              centerTitle: true,
              elevation: 0.0,
              actions: [
                /*IconButton(
                  icon: Icon(Icons.logout),
                  iconSize: 30,
                  onPressed: () {
                    secureStorage.delete('token');

                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                        builder: (BuildContext context) => LoginScreen(),
                      ),
                      (router) => false,
                    );
                  },
                ),*/

                IconButton(
                  icon: Icon(Icons.message),
                  iconSize: 30,
                  onPressed: () {
                    print("open dm");
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => ChatScreen()));
                  },
                ),
              ],
            );
          } else {
            return AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                "Ulker Social V2",
                style: TextStyle(fontSize: 20),
              ),
              centerTitle: true,
              elevation: 0.0,
              actions: [],
            );
          }
        }
      },
    );
  }
}
