import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class CommentModal extends StatefulWidget {
  final loadPosts;
  final String token;
  final user;
  final profile;
  final post;
  final reelsMode;

  CommentModal({required this.loadPosts, required this.token, required this.post, this.user, this.profile, this.reelsMode});

  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  var inputValue = "";
  var inputController = TextEditingController();
  var profile;
  bool isLoading = false;
  final SecureStorage secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.post['comments'].length,
                itemBuilder: (context, index) {
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
                              image: NetworkImage(widget.post['comments'][index]
                                      ['postedBy']['pic'] ??
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
                                widget.post['comments'][index]['postedBy']
                                    ['name'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget.post['comments'][index]['text'],
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
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
                          controller: inputController,
                          readOnly: isLoading,
                          onChanged: (newValue) {
                            setState(() {
                              inputValue = newValue;
                            });
                          },
                          cursorColor: Colors.white,
                          decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
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
                        child: Text(
                          isLoading ? "Yükleniyor" : "Gönder",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: isLoading
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  var profile_ = await secureStorage.read('profile');
    
                                  if (profile_ != null && profile_.isNotEmpty) {
                                    profile_ = profile_.trim();
    
                                    var jsonProfile = jsonDecode(profile_);
    
                                    setState(() {
                                      profile = jsonProfile;
                                    });
                                  }
                                  var uri = Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/comment");

                                  if (widget.reelsMode != null) {
                                    if (widget.reelsMode) {
                                      uri = Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/reel/comment");
                                    }
                                  }

                                  var body = {
                                    'text': inputValue
                                  };

                                  if (widget.reelsMode != null && widget.reelsMode == true) {
                                    body['reelId'] = widget.post['_id'];
                                  } else {
                                    body['postId'] = widget.post['_id'];

                                  }

                                  var res = await http.put(
                                    uri,
                                    headers: {
                                      'Content-Type': 'application/json',
                                      'Authorization': "${widget.token}"
                                    },
                                    body: json.encode(body),
                                  );

                                  print(uri);
                                  print(body);
                                  print(res.body);
                                  
                                  //widget.loadPosts(0, false);
    
                                  setState(() {
                                    widget.post['comments'].add({
                                      "_id": "new_${new Random()}",
                                      "text": inputValue,
                                      "postedBy": {
                                        "_id": "${widget.user}",
                                        "name": "${profile['name']}",
                                        "pic": "${profile['pic']}",
                                      }
                                    });
                                  });

                                  inputController.clear();
                                  
                                  //Navigator.of(context).pop();
                                } catch (e) {
                                  print("Error: $e");
                                  //Navigator.of(context).pop();
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
