import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/Drawer.dart';
import 'package:ulkersocialv2/components/Explore/Body.dart';
import 'package:ulkersocialv2/screens/CreatePostScreen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: ExploreScreenBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) => CreatePostScreen())),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
