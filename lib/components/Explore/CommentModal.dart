import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentModal extends StatefulWidget {
  final Function loadPosts;
  final String token;
  final post;

  CommentModal(
      {required this.loadPosts, required this.token, required this.post});

  @override
  _CommentModalState createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  var inputValue = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75, // Set a fixed height
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
                      child: Text(isLoading ? "Yükleniyor" : "Gönder", style: TextStyle(color: Colors.white),),
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
                                await http.put(
                                  Uri.parse(
                                      "https://ulker-social-backend.tarikadmin35.repl.co/comment"),
                                  headers: {
                                    'Content-Type': 'application/json',
                                    'authorization': "${widget.token}"
                                  },
                                  body: json.encode({
                                    'postId': widget.post['_id'],
                                    'text': inputValue
                                  }),
                                );

                                await widget.loadPosts();
                                Navigator.of(context).pop();
                              } catch (e) {
                                Navigator.of(context).pop();
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
    );
  }
}
