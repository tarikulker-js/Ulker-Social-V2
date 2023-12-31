import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final SecureStorage secureStorage = SecureStorage();
  var myId = "";
  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  late IO.Socket socket;

  void initState() {
    super.initState();

    loadMessages();
  }

  @override
  void dispose() {
    myId = "";
    messages = [];
    messageController = TextEditingController();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
    isLoading = true;

    super.dispose();
  }

  void loadMessages() async {
    var userId = await secureStorage.read('user');

    final response = await http.get(Uri.parse(
        "https://ulker-social-backend.tarikadmin35.repl.co/get-messages"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;

      if (mounted) {
        setState(() {
          myId = "$userId";
          messages = jsonData.map((message) {
            return {
              "_id": message!["_id"],
              "data": {
                "message": message!["data"]!["message"],
                "authorName": message!["data"]!["authorName"],
              },
              "author": message!["author"],
              "createdAt": DateTime.parse(message!["createdAt"]),
            };
          }).toList();
          isLoading = false;
        });
      }

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    } else {
      throw Exception("Failed to load messages");
    }

    // ! Socket Connection
    socket = IO.io(
        'https://ulker-social-backend.tarikadmin35.repl.co', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // ! Socket Listening new messages
    socket.on('message', (data) {
      if (data != null) {
        String messageId = data["_id"] is String ? data["_id"] : "";
        String messageText = data["data"] is Map<String, dynamic>
            ? (data["data"]["message"] is String ? data["data"]["message"] : "")
            : "";
        String authorName = data["author"] is Map<String, dynamic>
            ? (data["author"]["name"] is String ? data["author"]["name"] : "")
            : "";
        DateTime createdAt = data["createdAt"] != null
            ? (data["createdAt"] is String
                ? DateTime.parse(data["createdAt"])
                : DateTime.now())
            : DateTime.now();

        if (mounted) {
          setState(() {
            messages.add({
              "_id": messageId,
              "data": {
                "message": messageText,
                "authorName": authorName,
              },
              "author": data["author"],
              "createdAt": createdAt,
            });
          });
        }
        
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      }
    });
  }

  void sendMessage(String messageText) {
    var data = {
      'message': messageText,
      'author': {"_id": myId}
    };

    // ! Socket sending new message
    socket.emit('message', {'message': messageText, 'author': myId});

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    });

    messageController.clear();

    FocusScope.of(context).requestFocus(_focusNode);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ulker Social V2")),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            Text(myId),
            // ! Messages
            _buildChatMessages(),

            // ! Send Message Box
            _buildChatSendMessage(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatSendMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                if (messageController.text.isNotEmpty) {
                  sendMessage(messageController.text);
                }
              },
              focusNode: _focusNode,
              cursorColor: Colors.white,
              controller: messageController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: "Mesajınız",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                sendMessage(messageController.text);
              }
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final bool isMyMessage = message['author']['_id'] == myId;

          // ! Message Box
          return _buildChatMessageBox(isMyMessage, message);
        },
      ),
    );
  }

  Widget _buildChatMessageBox(bool isMyMessage, Map<String, dynamic> message) {
    return Container(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            !isMyMessage ? message['author']['name'] : "Siz",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isMyMessage ? Colors.blue : Colors.grey,
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              message['data']['message'] ?? "",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Text(
            message.containsKey("createdAt")
                ? formatCreatedAt(
                    DateTime.parse(message["createdAt"].toString()))
                : formatCreatedAt(DateTime.now()),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
