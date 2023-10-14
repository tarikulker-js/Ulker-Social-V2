import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/LikesModal.dart';
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
  dynamic isFollowing = false;

  isFollowingUser(user, myId) async {
    var profile = await secureStorage.read('profile');

    var followers = user['followers'];
    if (followers != null && followers.length > 0) {
      for (var follower in followers) {
        if (follower["_id"] == myId) {
          return true;
        }
      }
    } else {
      return false;
    }
    return false;
  }

  void unFollowProfile(dynamic followers, String id) {
    for (int i = 0; i < followers.length; i++) {
      if (followers[i]['_id'] == id) {
        followers.removeAt(i);
        break;
      }
    }
  }

  void loadToken() async {
    var jwt = await secureStorage.read('token');

    setState(() {
      token = "$jwt";
    });
  }

  checkIsFollowing() async => await isFollowingUser(widget.user, widget.myId);
  setIsFollowing() async => isFollowing = await checkIsFollowing();

  void initState() {
    super.initState();
    print(widget.user);

    loadToken();
    // isFollowing değişkenini başlangıçta ayarlayın
    setIsFollowing();

  }

  @override
  Widget build(BuildContext context) {
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
            _buildProfileFollowUnfollowButton(widget.user, widget.myId),

            // ! Posts
            _buildProfilePosts(posts)
          ],
        ));
  }

  Widget _buildProfileFollowUnfollowButton(user, myId) {
    return TextButton(
      onPressed: () async {
        var myProfile_ = await secureStorage.read('profile');
        var myProfile = jsonDecode("$myProfile_");

        if (isFollowing) {
          // ! Unfollow logic
          setState(() {
            isFollowing = false;
            
            if (user['followers'] == null) {
              user['followers'] = [];
            }

            unFollowProfile(user['followers'], myId);
          });

          var res = await http.put(
              Uri.parse(
                  "https://ulker-social-backend.tarikadmin35.repl.co/unfollow"),
              headers: {
                'Content-Type': 'application/json',
                'authorization': '$token'
              },
              body: json.encode({'unfollowId': widget.user['_id']}));

        } else {
          // ! Follow logic
          setState(() {
            isFollowing = true;
            
            if (user['followers'] == null) {
              user['followers'] = [];
            }
            user['followers'].add({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
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
      child: Text(isFollowing == true ? "Unfollow" : "Follow"),
      style: TextButton.styleFrom(
        backgroundColor: isFollowing == true ? Colors.grey : Colors.blue,
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
              widget.user['posts'] != null
                  ? widget.user['posts'].length.toString()
                  : "0",
              "Post"),
          InkWell(
            onTap: () {
              showModalBottomSheet(
              context: context,
              barrierColor: Colors.black12.withOpacity(0.6),
              barrierLabel: 'Dialog',
              builder: (_) {
                return LikesModal(post: { 'likes': widget.user['followers'] }, myId: "myId", token: token, mode: "followersCounter",);
              },
            );
            },
            child: counter(
                widget.user['followers'] != null
                    ? widget.user['followers'].length.toString()
                    : "0",
                "Takipçi"),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
              context: context,
              barrierColor: Colors.black12.withOpacity(0.6),
              barrierLabel: 'Dialog',
              builder: (_) {
                return LikesModal(post: { 'likes': widget.user['following'] }, myId: "myId", token: token, mode: "followingCounter",);
              },
            );
            },
            child: counter(
                widget.user['following'] != null
                    ? widget.user['following'].length.toString()
                    : "0",
                "Takip"),
          ),
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
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                "${widget.user['name']} ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
        ),

        // ! Web Site
        Positioned(
            bottom: 0,
            left: 140,
            child: GestureDetector(
              onTap: () async { 
                if (!await launchUrl(Uri(
                  scheme: "mailto",
                  path: widget.user['email']
                ))) {
                  ToastMessage(context, "E-Posta Bulunamadı", "E-Posta bulunamadı.", type: "error");
                }
              },
              child: Text(
                widget.user['email'],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
        ),

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
