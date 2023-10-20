import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/Reels/Content.dart';
import 'package:ulkersocialv2/screens/CreateReelsScreen.dart';
import 'package:ulkersocialv2/screens/MainScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class ReelsScreen extends StatefulWidget {
  final src;

  const ReelsScreen({super.key, this.src});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  SecureStorage secureStorage = SecureStorage();
  List<dynamic> reels = [];
  String token = "";
  String myId = "";
  bool isLoading = true;

  _loadReels() async {
    setState(() {
      isLoading = true;
    });
    final token_ = await secureStorage.read('token');
    final myId_ = await secureStorage.read('user');

    var reelsRes = await http.get(
      Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/allreels"),
      headers: {
        'Content-Type': "application/json",
        'Authorization': "$token_"
      }
    );

    if (mounted) {
      setState(() {
        token = "$token_";
        myId = "$myId_";
        reels = jsonDecode(reelsRes.body)['reels'];
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    token = "";
    myId = "";
    reels = [];
    isLoading = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: !isLoading ? Container(
        child: Stack(
          children: [
            Swiper(
							loop: false,
              itemCount: reels.length,
              itemBuilder: (context, index) {
                return ReelsContent(
                  reel: reels[index],
									token: token,
									loadReels: _loadReels,
									myId: myId,
                );
              },
              scrollDirection: Axis.vertical,
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (BuildContext context) => const MainScreen()), (router) => false);
                },
                child: Icon(
                  Icons.arrow_back, 
                  color: Colors.white, size: 36,
                )
              )
            ),
            Positioned(
              top: 0,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    token = "";
                    myId = "";
                    reels = [];
                    isLoading = true;
                  });
                  Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (BuildContext context) => CreateReelsScreen()), (router) => false);
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white, size: 36,
                )
              )
            )
          ],
        ),
      ) : SizedBox(),
    ));
  }
}