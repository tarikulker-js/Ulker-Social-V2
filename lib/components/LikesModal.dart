import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:ulkersocialv2/screens/ProfileScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class LikesModal extends StatefulWidget {
  final post;
  final myId;
  final token;
  var mode;

  LikesModal(
      {required this.post, required this.myId, required this.token, this.mode});

  @override
  _LikesModalState createState() => _LikesModalState();
}

class _LikesModalState extends State<LikesModal> {
  var inputValue = "";
  var inputController = TextEditingController();
  var profile;
  var loadingProfile = false;
  bool isLoading = false;
  final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();

    if (widget.mode == null) {
      setState(() {
        widget.mode = "likeCounter";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  widget.mode == "followersCounter"
                      ? "Takipçiler"
                      : widget.mode == "followingCounter"
                          ? "Takip Edilenler"
                          : "Beğenenler",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "${widget.post['likes'].length} ${widget.mode == "followersCounter" ? "Takipçi" : widget.mode == "followingCounter" ? "Takip" : "Beğenme"}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 0.5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.post['likes'].length,
                itemBuilder: (context, index) {
                  print(widget.post['likes']);

                  if (widget.post['likes'][index] is String == false) {
                    if (widget.post['likes'][index].containsKey('pic')) {
                      widget.post['likes'][index]['pic'] = widget.post['likes']
                              [index]['pic']
                          .toString()
                          .replaceAll("http://", "https://");
                    }
                  }

                  return Container(
                      padding: EdgeInsets.all(8.0),
                      constraints: BoxConstraints(minHeight: 100),
                      decoration: BoxDecoration(),
                      child: InkWell(
                        onTap: () async {
                          print("clicked $loadingProfile");

                          if (loadingProfile == false) {
                            setState(() {
                              loadingProfile = true;
                            });

                            var profileRes = await http.get(
                                Uri.parse(
                                    "https://ulker-social-backend.tarikadmin35.repl.co/user/${widget.post['likes'][index]['_id']}"),
                                headers: {
                                  'content-type': "application/json",
                                  'authorization': "${widget.token}"
                                });

                            var profile = jsonDecode(profileRes.body)['user'];
                            profile['posts'] =
                                jsonDecode(profileRes.body)['posts'];

                            await Navigator.of(context).push(CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    ProfileScreen(
                                      user: profile,
                                      myId: widget.myId,
                                    )));

                            setState(() {
                              loadingProfile = false;
                            });
                          } else {
                            ToastMessage(context, "Yükleniyor...",
                                "yükleniyor kardeşim az bekle amq",
                                type: "error");
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: widget.post['likes'][index] != null && 
                              widget.post['likes'][index] is Map &&
                              widget.post['likes'][index]?.containsKey("pic")
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${widget.post['likes'][index]['pic']}"),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              widget.post['likes'][index] is Map && widget.post['likes'][index]?.containsKey("name") ? "${widget.post['likes'][index]['name']}" : "",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            if (widget.mode != "followersCounter" &&
                                widget.mode != "followingCounter")
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
