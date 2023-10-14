import 'dart:convert';
import 'dart:math';
import 'package:flutter/src/scheduler/binding.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ProfileScreen.dart';
import 'package:http/http.dart' as http;
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class Stories extends StatefulWidget {
  var loading;
  var updateLoading;
  var page;
  var setPage;

  Stories({
    Key? key,
    this.loading,
    this.updateLoading,
    this.page,
    this.setPage,
  }) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final secureStorage = SecureStorage();

  var users = [];
  var userId = "";
  int take = 5;
  bool _usersLoaded = false;
  bool paginationLoading = false;
  bool endedUsers = false;

  int oldPage = -1;
  final controller = ScrollController();

  loadUsers(skip, addStories) async {
    if (_usersLoaded == false && widget.loading == false || endedUsers) {
      return;
    }
    
    if (mounted) {
      setState(() {
        _usersLoaded = false;
      });
    }

    if (skip == null) {
      skip = 0;
    }

    var token = await secureStorage.read('token');
    var user = await secureStorage.read('user');

    var usersResponse = await http.get(
        Uri.parse(
            'https://ulker-social-backend.tarikadmin35.repl.co/users?skip=$skip&take=$take'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': '$token'
        });

    if (usersResponse.statusCode == 200) {
      var jsonData = json.decode(usersResponse.body);
      if (mounted) {
        setState(() {
          userId = "$user";
          
          if (addStories == true) {
            users.addAll(jsonData['users']);
          } else {
            users = jsonData['users'];
          }
          
          widget.loading = false;
          _usersLoaded = true;
          paginationLoading = false;
          oldPage = widget.page;

          if (jsonData['users'].length == 0) {
            endedUsers = true;
          }
        });
      }

      if (widget.updateLoading != null) {
        widget.updateLoading!(false);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.loading) {
      setState(() => {endedUsers = false});

      loadUsers(0, false);
    }

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (mounted) {
          setState(() {
            widget.setPage(widget.page + 1);
          });
        }
      }
    });
  }

  void didUpdateWidget(Stories oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.loading && !endedUsers) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          if (widget.page != 0) {
            widget.setPage(0);
          }
        }
      });

      
      print("page sıfırlandı !");
      loadUsers(0, false);
    } else if (!widget.loading && widget.page != oldPage) {
      if (mounted) {
        setState(() {
          paginationLoading = true;
        });
      } 
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        controller.jumpTo(controller.position.maxScrollExtent - 65);
      });
      
      loadUsers(take * widget.page, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Container(
        height: 95,
      );
    } else {
      return Container(
        height: 95,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(bottom: BorderSide(color: Colors.black, width: 0.2)),
        ),
        child: ListView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            if (users.length == 0 && !paginationLoading)
              Center(
                child: const Text(
                  "Kullanıcılar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ...users.map((user) => _buildProfileItem(user)).toList(),
            if (paginationLoading && !endedUsers)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65,
                  width: 65,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            SizedBox(
              width: 130,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildProfileItem(user) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => ProfileScreen(
                    user: user,
                    myId: userId,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: "${user['_id']}",
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(user['pic'] != null
                                ? user['pic']
                                : "https://res.cloudinary.com/doaf7ybhd/image/upload/v1621854139/default-profile.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "${user['name']}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
