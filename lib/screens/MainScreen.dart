import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/Drawer.dart';
import 'package:ulkersocialv2/components/Home/Body.dart';
import 'package:ulkersocialv2/screens/CreatePostScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: MainScreenBody(),
      floatingActionButton: FloatingActionButton(
        heroTag: "createPostMain",
        child: Icon(Icons.add_a_photo),
        onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) => CreatePostScreen())),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
