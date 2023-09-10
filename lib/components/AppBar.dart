import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ChatScreen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Ulker Social V2",
        style: TextStyle(
          fontSize: 20
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 30, 
        onPressed: () { print("open drawer"); },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.message),
          iconSize: 30, 
          onPressed: () { 
            print("open dm"); 
            Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) => ChatScreen()));
          },
        ),
      ],
    );
  }
}
