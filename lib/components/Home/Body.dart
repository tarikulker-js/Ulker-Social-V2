import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/Home/Posts.dart';
import 'package:ulkersocialv2/components/Home/Stories.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stories(),
        //SizedBox(height: 5),
        Posts(),
      ],
    );
  }

}
