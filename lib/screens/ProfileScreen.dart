import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final user;
  final myId;

  const ProfileScreen({Key? key, required this.user, this.myId})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SecureStorage secureStorage = SecureStorage();
  var token = "";
  bool isFollowing = false;

  bool isFollowingUser(user, myId) {
    var followers = user['followers'];
    if (followers != null && followers.length > 0) {
      return followers.contains(myId);
    } else {
      return false;
    }
  }

  void loadToken() async {
    var jwt = await secureStorage.read('token');

    setState(() {
      token = "$jwt";
    });
  }

  void initState() {
    super.initState();
    loadToken();
    // isFollowing değişkenini başlangıçta ayarlayın
    isFollowing = isFollowingUser(widget.user, widget.myId);
  }

  @override
  Widget build(BuildContext context) {
    bool isFollowing = isFollowingUser(widget.user, widget.myId);
    var posts = widget.user['posts'];
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        //appBar: const MyAppBar(),
        body: ListView(
          children: [
            // ! Header
            _buildProfileHeader(context),

            // ! Body

            // ! Social Counters
            _buildProfileSocialCounter(),

            // ! Follow Button
            _buildProfileFollowUnfollowButton(),

            // ! Posts
            _buildProfilePosts(posts)
          ],
        ));
  }

  Widget _buildProfileFollowUnfollowButton() {
    return TextButton(
      onPressed: () async {
        if (isFollowing) {
          // ! Unfollow logic
          setState(() {
            isFollowing = false;
          });

          var res = await http.put(
              Uri.parse(
                  "https://ulker-social-backend.tarikadmin35.repl.co/unfollow"),
              headers: {
                'Content-Type': 'application/json',
                'authorization': '$token'
              },
              body: json.encode({'followId': widget.user['_id']}));
        } else {
          // ! Follow logic
          setState(() {
            isFollowing = true;
          });

          var res = await http.put(
              Uri.parse(
                  "https://ulker-social-backend.tarikadmin35.repl.co/follow"),
              headers: {
                'Content-Type': 'application/json',
                'authorization': '$token'
              },
              body: json.encode({'followId': widget.user['_id']}));
        }
      },
      child: Text(isFollowing ? "Unfollow" : "Follow"),
      style: TextButton.styleFrom(
        backgroundColor: isFollowing ? Colors.grey : Colors.blue,
      ),
    );
  }

  Widget _buildProfileSocialCounter() {
    return Container(
      width: double.infinity,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          counter(
              widget.user['following'] != null
                  ? widget.user['following'].length.toString()
                  : "0",
              "Takip"),
          counter(
              widget.user['followers'] != null
                  ? widget.user['followers'].length.toString()
                  : "0",
              "Takipçi"),
          counter(
              widget.user['posts'] != null
                  ? widget.user['posts'].length.toString()
                  : "0",
              "Post"),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Stack(
      children: [
        // ! Main Container
        Container(
          width: double.infinity,
          height: 230,
        ),

        // ! Cover Photo
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg"),
                  fit: BoxFit.cover)),
        ),

        // ! Profile Photo
        Positioned(
          left: 20,
          bottom: 0,
          child: Hero(
            tag: widget.user['_id'],
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                    image: NetworkImage(widget.user['pic'] != null
                        ? widget.user['pic']
                        : "https://res.cloudinary.com/doaf7ybhd/image/upload/v1621854139/default-profile.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),

        // ! User Name
        Positioned(
            bottom: 16,
            left: 140,
            child: Text(
              widget.user['name'],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),

        // ! Back Button
        Container(
          width: 50,
          height: 50,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, true),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildProfilePosts(posts) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: posts?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(posts[index]['picture'] != null
                  ? posts[index]['picture']
                  : "https://res.cloudinary.com/doaf7ybhd/image/upload/v1621854139/default-profile.png"),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

Column counter(String value, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        value,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      Text(
        title,
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}
