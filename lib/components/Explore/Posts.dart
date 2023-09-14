import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/components/Explore/CommentModal.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class Posts extends StatefulWidget {
  var loading;
  var page;
  var updateLoading;
  ScrollController controller;

  Posts(
      {Key? key,
      this.loading,
      this.page,
      this.updateLoading,
      required this.controller})
      : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final SecureStorage secureStorage = SecureStorage();
  var posts = [];
  var myId = "";
  var token = "";
  int take = 5;
  bool _postsLoaded = false;
  bool paginationLoading = false;
  bool endedPosts = false;

  _loadPosts(skip) async {
    if (_postsLoaded == false && widget.loading == false || endedPosts) {
      return;
    }
    setState(() {
      _postsLoaded = false;
    });

    if (skip == null) {
      skip = 0;
    }

    final jwt = await secureStorage.read('token');
    final user = await secureStorage.read('user');

    final postsResponse = await http.get(
        Uri.parse(
            "https://ulker-social-backend.tarikadmin35.repl.co/allpost?skip=$skip&take=$take"),
        headers: {'Content-Type': 'application/json', 'authorization': "$jwt"});

    if (postsResponse.statusCode == 200) {
      final jsonData = json.decode(postsResponse.body) as dynamic;

      setState(() {
        myId = "$user";
        posts.addAll(jsonData['posts']);
        token = "$jwt";
        widget.loading = false;
        _postsLoaded = true;
        paginationLoading = false;

        if (jsonData['posts'].length == 0) {
          endedPosts = true;
        }
      });

      widget.updateLoading!(false);
    }
  }

  deletePost(post) async {
    final response = await http.delete(
        Uri.parse(
            "https://ulker-social-backend.tarikadmin35.repl.co/deletepost/${post['_id']}"),
        headers: {
          'Content-Type': 'application/json',
          'authorization': '$token'
        });

    if (response.statusCode == 200) {
      widget.updateLoading!(true);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.loading) {
      _loadPosts(0);
    }
  }

  void didUpdateWidget(Posts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loading && !oldWidget.loading && !endedPosts) {
      _loadPosts(0);
    } else if (widget.page != null && widget.page != oldWidget.page) {
      setState(() {
        paginationLoading = true;
      });
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        widget.controller
            .jumpTo(widget.controller.position.maxScrollExtent - 50);
      });

      _loadPosts(take * widget.page);
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
        children: [
          if (posts.length == 0 && !paginationLoading)
            Center(
              child: const Text(
                "Takip ettiklerinizin bir gönderisi yok.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ...posts.map((post) => _buildPostItem(post)).toList(),
          if (paginationLoading && !endedPosts)
            Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          if (endedPosts)
            Center(
              child: Text(
                "Tebrikler, gönderilerin sonuna geldiniz.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          SizedBox(
            height: 150,
          ),
        ],
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
              _buildPostHeader(user, post),
              _buildPostBody(post),
              _buildPostFooter(post, user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostHeader(user, post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ! Profile Picture
        Row(
          children: [
            Container(
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

        // ! Delete Button
        if (myId == user['_id'])
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () async => deletePost(post),
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
                  post['title'] != null
                      ? post['title'].toString()
                      : '',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  post['body'] != null ? post['body'].toString() : '',
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
                    return CommentModal(
                        loadPosts: _loadPosts, token: token, post: post);
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
