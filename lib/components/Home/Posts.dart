import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/components/CommentModal.dart';
import 'package:ulkersocialv2/components/LikesModal.dart';
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:ulkersocialv2/screens/ProfileScreen.dart';
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
  dynamic myProfile = {};
  var token = "";
  int take = 5;
  int loadCounter = 0;
  bool _postsLoaded = false;
  bool paginationLoading = false;
  bool endedPosts = false;
  bool loadingProfile = false;

  _loadPosts(skip, [bool addPosts = false]) async {
    if (_postsLoaded == false && widget.loading == false || endedPosts) {
      return;
    }
    setState(() {
      _postsLoaded = false;
    });

    if (loadCounter >= 3) {
      /*setState(() {
        posts = [];
        _postsLoaded=true;
      });
      
      return;*/
    }

    if (skip == null) {
      skip = 0;
    }

    final jwt = await secureStorage.read('token');
    final user = await secureStorage.read('user');
    final profile = await secureStorage.read('profile');
    
    print(" \n skip: $skip \n take: $take ");

    final postsResponse = await http.get(
        Uri.parse(
            "https://ulker-social-backend.tarikadmin35.repl.co/getsubpost?skip=$skip&take=$take"),
        headers: {'Content-Type': 'application/json', 'authorization': "$jwt"});

    if (postsResponse.statusCode == 200) {
      final jsonData = json.decode(postsResponse.body) as dynamic;

      if (mounted) {
        setState(() {
          myId = "$user";
          myProfile = jsonDecode("$profile");

          if (addPosts == true) {
            posts.addAll(jsonData['posts']);
          } else {
            posts = jsonData['posts'];
          }

          token = "$jwt";
          widget.loading = false;
          _postsLoaded = true;
          paginationLoading = false;
          loadCounter = loadCounter + 1;

          if (jsonData['posts'].length == 0) {
            endedPosts = true;
          }
        });
      }
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
      ToastMessage(context, "Gönderi silindi",
          "Gönderini başarıyla arabistana yolladın.");
      widget.updateLoading!(true);
    }
  }

  bool containsId(dynamic likes, String id) {
    if (likes.isNotEmpty) {
      for (var like in likes) {
        if (like is Map) {
          if (like.containsKey('_id') && id.isNotEmpty) {
            if (like['_id'] == id) {
              return true;
            }
          }
        }
      }

    }
    return false;
  }

  void unlikePost(dynamic likes, String id) {
    for (int i = 0; i < likes.length; i++) {
      if (likes[i]['_id'] == id) {
        likes.removeAt(i);
        break;
      }
    }
  }


  @override
  void initState() {
    super.initState();

    if (widget.loading) {
      setState(() => {endedPosts = false});

      _loadPosts(0);
    }
  }

  void didUpdateWidget(Posts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loading && !oldWidget.loading) {
      setState(() => {endedPosts = false, widget.page = 0});

      widget.page = 0;

      _loadPosts(0);
    } else if (widget.page != null && widget.page != oldWidget.page) {
      setState(() {
        paginationLoading = true;
      });
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        widget.controller
            .jumpTo(widget.controller.position.maxScrollExtent - 50);
      });

      _loadPosts(take * widget.page, true);
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
        GestureDetector(
          onTap: () async {
            print("clicked $loadingProfile");

            if (loadingProfile == false) {
              setState(() {
                loadingProfile = true;
              });

              var profileRes = await http.get(
                  Uri.parse(
                      "https://ulker-social-backend.tarikadmin35.repl.co/user/${user['_id']}"),
                  headers: {
                    'content-type': "application/json",
                    'authorization': "$token"
                  });

              var profile = jsonDecode(profileRes.body)['user'];
              profile['posts'] = jsonDecode(profileRes.body)['posts'];
              
              await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) => ProfileScreen(
                        user: profile,
                        myId: myId,
                      )));

              setState(() {
                loadingProfile = false;
              });
            } else {
              ToastMessage(
                  context, "Yükleniyor...", "yükleniyor kardeşim az bekle amq",
                  type: "error");
            }
          },
          child: Row(
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
                      style: const TextStyle(
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
                  post['post'] != null ? post['post'].toString() : '',
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
            bool isLiked = containsId(post['likes'], myId, );

            setState(() {
              if (isLiked) {
                // Unlike
                unlikePost(post['likes'], myId);
              } else {
                // Like
                post['likes'].add({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
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
                  unlikePost(post['likes'], myId);
              if (json.decode(res.body) == null) {
                setState(() {
                  print({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
                  post['likes'].add({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
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

  String formatCreatedAt(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 0) {
      return DateFormat('d MMM y', "tr-TR").format(createdAt);
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'şimdi';
    }
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
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        barrierColor: Colors.black12.withOpacity(0.6),
                        barrierLabel: 'Dialog',
                        builder: (_) {
                          return LikesModal(post: post, myId: myId, token: token,);
                        },
                      );
                    },
                    child: Text("$likesCount Beğenme",
                        style: TextStyle(color: Colors.white)),
                  );
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
                bool isLiked = containsId(post['likes'], myId);

                return IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                  ),
                  color: Colors.red,
                  onPressed: () async {
                    setState(() {
                      if (isLiked) {
                        // Unlike
                        unlikePost(post['likes'], myId);
                      } else {
                        // Like
                        print({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
                        post['likes'].add({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
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
                          unlikePost(post['likes'], myId);
                      if (json.decode(res.body) == null) {
                        setState(() {
                          print({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
                          post['likes'].add({ "pic": myProfile['pic'], "name": myProfile['name'], "_id": myProfile['_id'] });
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
                  barrierColor: Colors.black12.withOpacity(0.6),
                  barrierLabel: 'Dialog',
                  builder: (_) {
                    return CommentModal(
                        user: user,
                        loadPosts: _loadPosts,
                        token: token,
                        post: post);
                  },
                );
              },
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                  formatCreatedAt(DateTime.parse(post['createdAt'])).toString(),
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
