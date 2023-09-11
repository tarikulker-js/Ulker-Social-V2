import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/screens/ProfileScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class Posts extends StatefulWidget {
  var loading;
  var updateLoading;
  Posts({Key? key, this.loading, this.updateLoading}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final SecureStorage secureStorage = SecureStorage();
  var posts = [];
  var myId = "";
  var token = "";

  void _loadPosts() async {
    final jwt = await secureStorage.read('token');
    final user = await secureStorage.read('user');
    print("$user");

    final postsResponse = await http.get(
        Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/allpost"),
        headers: {'Content-Type': 'application/json', 'authorization': "$jwt"});

    print(postsResponse.statusCode);

    if (postsResponse.statusCode == 200) {
      final jsonData = json.decode(postsResponse.body) as dynamic;

      setState(() {
        print('data ------> ${jsonData['posts']}');

        myId = "$user";
        posts = jsonData['posts'];
        token = "$jwt";
        widget.loading = false;
      });

      widget.updateLoading!(false);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.loading) {
      _loadPosts();
    }
  }

  void didUpdateWidget(Posts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loading && !oldWidget.loading) {
      _loadPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
      );
    } else {
      return Column(
        children: posts.length == 0
            ? [
                Center(
                  child: const Text("Takip ettiklerinizin bir gönderisi yok.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                )
              ]
            : posts.map((post) => _buildPostItem(post)).toList(),
      );
    }
  }

  Widget _buildPostItem(post) {
    var user = post['postedBy'];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPostHeader(user),
              _buildPostBody(post),
              _buildPostFooter(post, user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader(user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ! Profile Picture
        Row(
          children: [
            InkWell(
              onTap: () async {
                /*var result =
                    await Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => ProfileScreen(
                              user: user,
                              myId: "userId",
                            )));

                if (result) {
                  print("Back to main screen");
                }*/
              },
              child: Hero(
                tag: user['_id'],
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(user['pic']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ! User Name
                  Text(
                    user['name'],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // ! Post Created At
                ],
              ),
            ),
          ],
        ),

        // ! More Button
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            print("more");
          },
        ),
      ],
    );
  }

  Widget _buildPostBody(post) {
    return Column(
      children: [
        // ! Title & Description
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8.0, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post?.containsKey('title') ? post['title'] : '',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  /*post?.containsKey('body') ? post['body'] : */ '',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        // ! Image
        InkWell(
          onDoubleTap: () async {
            ValueNotifier<int> likesCountNotifier =
                ValueNotifier<int>(post['likes'].length);
            bool isLiked = post['likes'].contains(myId);

            setState(() {
              if (isLiked) {
                // Unlike
                post['likes'].remove(myId);
              } else {
                // Like
                post['likes'].add(myId);
              }
              likesCountNotifier.value =
                  post['likes'].length; // Update likes count
            });

            if (isLiked) {
              var res = await http.put(
                Uri.parse(
                    "https://ulker-social-backend.tarikadmin35.repl.co/unlike"),
                headers: {
                  'Content-Type': 'application/json; charset=utf-8',
                  'authorization': '$token'
                },
                body: json.encode({'postId': post['_id']}),
              );

              if (json.decode(res.body) == null) {
                setState(() {
                  post['likes'].add(myId);
                  likesCountNotifier.value = post['likes'].length;
                });
              }
            } else {
              var res = await http.put(
                Uri.parse(
                    "https://ulker-social-backend.tarikadmin35.repl.co/like"),
                headers: {
                  'Content-Type': 'application/json; charset=utf-8',
                  'authorization': '$token'
                },
                body: json.encode({'postId': post['_id']}),
              );

              if (json.decode(res.body) == null) {
                setState(() {
                  post['likes'].remove(myId);
                  likesCountNotifier.value = post['likes'].length;
                });
              }
            }
          },
          child: Center(
            child: post.containsKey('picture') && post['picture'] != null
                ? Image.network(
                    post['picture'],
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                : Text("Resim yok"), // Eğer "picture" yoksa bir metin göster
          ),
        ),
      ],
    );
  }

  Widget _buildPostFooter(post, user) {
    ValueNotifier<int> likesCountNotifier =
        ValueNotifier<int>(post['likes'].length);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ValueListenableBuilder<int>(
                valueListenable: likesCountNotifier,
                builder: (context, likesCount, child) {
                  return Text("$likesCount Likes",
                      style: TextStyle(color: Colors.white));
                },
              ),
            ),
          ],
        ),

        // ! Like Action
        Row(
          children: [
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                bool isLiked = post['likes'].contains(myId);

                return IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                  ),
                  color: Colors.red,
                  onPressed: () async {
                    setState(() {
                      if (isLiked) {
                        // Unlike
                        post['likes'].remove(myId);
                      } else {
                        // Like
                        post['likes'].add(myId);
                      }
                      likesCountNotifier.value = post['likes'].length;
                    });

                    if (isLiked) {
                      var res = await http.put(
                        Uri.parse(
                            "https://ulker-social-backend.tarikadmin35.repl.co/unlike"),
                        headers: {
                          'Content-Type': 'application/json; charset=utf-8',
                          'authorization': '$token'
                        },
                        body: json.encode({'postId': post['_id']}),
                      );

                      if (json.decode(res.body) == null) {
                        setState(() {
                          post['likes'].add(myId);
                          likesCountNotifier.value = post['likes'].length;
                        });
                      }
                    } else {
                      var res = await http.put(
                        Uri.parse(
                            "https://ulker-social-backend.tarikadmin35.repl.co/like"),
                        headers: {
                          'Content-Type': 'application/json; charset=utf-8',
                          'authorization': '$token'
                        },
                        body: json.encode({'postId': post['_id']}),
                      );

                      if (json.decode(res.body) == null) {
                        setState(() {
                          post['likes'].remove(myId);
                          likesCountNotifier.value = post['likes'].length;
                        });
                      }
                    }
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.comment),
              color: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildCommentModal(context, post);
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }

  Container _buildCommentModal(BuildContext context, post) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75, // Set a fixed height
      child: Column(
        children: [
          _buildCommentModalBody(post),
          _buildCommentModalFooter(context, post),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Expanded _buildCommentModalBody(post) {
    return Expanded(
      child: ListView.builder(
        itemCount: post['comments'].length,
        itemBuilder: (context, index) {
          return _buildPostComment(post['comments'][index]);
        },
      ),
    );
  }

  Container _buildCommentModalFooter(BuildContext context, post) {
    var inputValue = "";
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  onChanged: (newValue) {
                    setState(() {
                      inputValue = newValue;
                    });
                  },
                  cursorColor: Colors.white,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.0)),
                    labelText: "Yorumunuz",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: Text("Gönder"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    await http.put(
                        Uri.parse(
                            "https://ulker-social-backend.tarikadmin35.repl.co/comment"),
                        headers: {
                          'Content-Type': 'application/json',
                          'authorization': "$token"
                        },
                        body: json.encode(
                            {'postId': post['_id'], 'text': inputValue}));

                    _loadPosts();
                    Navigator.of(context).pop();
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildPostComment(comment) {
    return Container(
      padding: EdgeInsets.all(8.0),
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ! Profile Picture
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(47.5),
              image: DecorationImage(
                image: NetworkImage(comment['postedBy']['pic'] ??
                    "https://static.vecteezy.com/system/resources/previews/008/442/086/original/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.0),

          // User & Comment
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment['postedBy']['name'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  comment['text'],
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
