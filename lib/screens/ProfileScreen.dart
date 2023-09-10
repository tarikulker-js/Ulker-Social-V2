import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/AppBar.dart';

class ProfileScreen extends StatefulWidget {
  final user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFollowing = widget.user['followers'].contains("myId");
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
          _buildProfileFollowUnfollowButton(isFollowing),

          // ! Posts
          _buildProfilePosts(posts)
        ],
      )
    );
  }

  TextButton _buildProfileFollowUnfollowButton(bool isFollowing) {
    return TextButton(
          onPressed: () {
            if (isFollowing) {
              // Unfollow logic
              print("Unfollow");
            } else {
              // Follow logic
              print("Follow");
            }
          },
          child: Text(isFollowing ? "Unfollow" : "Follow"),
          style: TextButton.styleFrom(
            backgroundColor: isFollowing ? Colors.grey : Colors.blue,
          ),
        );
  }

  Container _buildProfileSocialCounter() {
    return Container(
          width: double.infinity,
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              counter(widget.user['following'].length.toString(), "Takip"),
              counter(widget.user['followers'].length.toString(), "Takipçi"),
              counter(widget.user['posts'].length.toString(), "Post"),

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
                    "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg"
                  ), 
                  fit: BoxFit.cover
                )
              ),
            ),

            // ! Profile Photo
            Positioned(
              left: 20,
              bottom: 0,
              child: Hero(
                tag: widget.user['id'],
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(widget.user['pic']),
                      fit: BoxFit.cover
                    ),
                          
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
                  color: Colors.white
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
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(posts[index]['picture']),
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),
        )
      ],
    );
  }