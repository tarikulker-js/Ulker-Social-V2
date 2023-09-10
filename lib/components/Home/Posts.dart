import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    var posts = [
      {
        "picture":
            "https://e0.pxfuel.com/wallpapers/860/734/desktop-wallpaper-dark-dark-graphy.jpg",
        "likes": [
          "6093b39b64fcfa14ef3915ce",
          "6093d891394ad906025998ca",
          "60996f0329c4280d5e7c3a09",
          "60a43100b95a830022ba6287",
          "608fd3d9fd53aa01d522c8c2",
          "60708e4ad80a530266eb5a23",
          "60708e4ad80a530266eb5a23",
          "60a25763e9b908006606650a"
        ],
        "_id": "6093d65e5ce01b03e2889411",
        "title": "test pic",
        "body": "",
        "postedBy": {
          "pic":
              "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620292504/u1uif1mvvdsyayegbjdb.jpg",
          "_id": "6093b39b64fcfa14ef3915ce",
          "name": "saymayi unutan tarik ab"
        },
        "comments": [
          {
            "_id": "60a24d235b1402050777705e",
            "text": "çok gıral adamsın tarık ab xD",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            }
          },
          {
            "_id": "60a9504e5136210031eb5661",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60a950515136210031eb5662",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60aa4e21487ae20030f9906e",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60aa4e21487ae20030f9906f",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60ac12a1d86a7d0031ebb97b",
            "text": "1",
            "postedBy": {"_id": "60ac11a4d86a7d0031ebb979", "name": "Tık"}
          },
          {
            "_id": "60ae7f63149b5200ce7dcdeb",
            "text": "2",
            "postedBy": {
              "_id": "60ae7ecbdbe3cd0030ffe064",
              "name": "Tarık Ülker"
            }
          },
          {
            "_id": "6168245b9433c2002f53359b",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245b9433c2002f53359c",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245d9433c2002f53359d",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359e",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359f",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f5335a0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335aa",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335ab",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ac",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ad",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ae",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335af",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ba",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bb",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bc",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bd",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335be",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335bf",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824689433c2002f5335c0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246a9433c2002f5335c1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          }
        ],
        "createdAt": "2021-05-06T11:43:26.941Z",
        "updatedAt": "2022-04-09T10:21:46.715Z",
        "__v": 0
      },
      
      {
        "picture":
            "https://res.cloudinary.com/doaf7ybhd/image/upload/v1618838364/default/defaultPost.jpg",
        "likes": [
          "6093b39b64fcfa14ef3915ce",
          "6093d891394ad906025998ca",
          "60996f0329c4280d5e7c3a09",
          "60a43100b95a830022ba6287",
          "608fd3d9fd53aa01d522c8c2",
          "60708e4ad80a530266eb5a23",
          "60708e4ad80a530266eb5a23",
          "60a25763e9b908006606650a"
        ],
        "_id": "6093d65e5ce01b03e2889411",
        "title": "test pic",
        "body": "",
        "postedBy": {
          "pic":
              "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620292504/u1uif1mvvdsyayegbjdb.jpg",
          "_id": "6093b39b64fcfa14ef3915ce",
          "name": "saymayi unutan tarik ab"
        },
        "comments": [
          {
            "_id": "60a24d235b1402050777705e",
            "text": "çok gıral adamsın tarık ab xD",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            }
          },
          {
            "_id": "60a9504e5136210031eb5661",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60a950515136210031eb5662",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60aa4e21487ae20030f9906e",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60aa4e21487ae20030f9906f",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60ac12a1d86a7d0031ebb97b",
            "text": "1",
            "postedBy": {"_id": "60ac11a4d86a7d0031ebb979", "name": "Tık"}
          },
          {
            "_id": "60ae7f63149b5200ce7dcdeb",
            "text": "2",
            "postedBy": {
              "_id": "60ae7ecbdbe3cd0030ffe064",
              "name": "Tarık Ülker"
            }
          },
          {
            "_id": "6168245b9433c2002f53359b",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245b9433c2002f53359c",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245d9433c2002f53359d",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359e",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359f",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f5335a0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335aa",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335ab",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ac",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ad",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ae",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335af",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ba",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bb",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bc",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bd",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335be",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335bf",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824689433c2002f5335c0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246a9433c2002f5335c1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          }
        ],
        "createdAt": "2021-05-06T11:43:26.941Z",
        "updatedAt": "2022-04-09T10:21:46.715Z",
        "__v": 0
      },
      {
        "picture":
            "https://res.cloudinary.com/doaf7ybhd/image/upload/v1618838364/default/defaultPost.jpg",
        "likes": [
          "6093b39b64fcfa14ef3915ce",
          "6093d891394ad906025998ca",
          "60996f0329c4280d5e7c3a09",
          "60a43100b95a830022ba6287",
          "608fd3d9fd53aa01d522c8c2",
          "60708e4ad80a530266eb5a23",
          "60708e4ad80a530266eb5a23",
          "60a25763e9b908006606650a"
        ],
        "_id": "6093d65e5ce01b03e2889411",
        "title": "test pic",
        "body": "",
        "postedBy": {
          "pic":
              "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620292504/u1uif1mvvdsyayegbjdb.jpg",
          "_id": "6093b39b64fcfa14ef3915ce",
          "name": "saymayi unutan tarik ab"
        },
        "comments": [
          {
            "_id": "60a24d235b1402050777705e",
            "text": "çok gıral adamsın tarık ab xD",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            }
          },
          {
            "_id": "60a9504e5136210031eb5661",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60a950515136210031eb5662",
            "text": "Çok kral adamsın tarık reis",
            "postedBy": {"_id": "60a43100b95a830022ba6287", "name": "ÖZMEN"}
          },
          {
            "_id": "60aa4e21487ae20030f9906e",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60aa4e21487ae20030f9906f",
            "text": "",
            "postedBy": {
              "_id": "60aa4d73487ae20030f9906c",
              "name": "test vol bilmem kaç"
            }
          },
          {
            "_id": "60ac12a1d86a7d0031ebb97b",
            "text": "1",
            "postedBy": {"_id": "60ac11a4d86a7d0031ebb979", "name": "Tık"}
          },
          {
            "_id": "60ae7f63149b5200ce7dcdeb",
            "text": "2",
            "postedBy": {
              "_id": "60ae7ecbdbe3cd0030ffe064",
              "name": "Tarık Ülker"
            }
          },
          {
            "_id": "6168245b9433c2002f53359b",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245b9433c2002f53359c",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245d9433c2002f53359d",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359e",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f53359f",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245e9433c2002f5335a0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168245f9433c2002f5335a3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824609433c2002f5335a6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335a9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335aa",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824619433c2002f5335ab",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ac",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ad",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ae",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335af",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335b9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335ba",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bb",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bc",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824639433c2002f5335bd",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335be",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824669433c2002f5335bf",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "616824689433c2002f5335c0",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246a9433c2002f5335c1",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c2",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c3",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c4",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c5",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c6",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246b9433c2002f5335c7",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c8",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          },
          {
            "_id": "6168246c9433c2002f5335c9",
            "text": "Yorum",
            "postedBy": {
              "_id": "60708e4ad80a530266eb5a23",
              "name": "GÜLLÜ ERHAN"
            },
            "likes": []
          }
        ],
        "createdAt": "2021-05-06T11:43:26.941Z",
        "updatedAt": "2022-04-09T10:21:46.715Z",
        "__v": 0
      },

    ];

    return Column(
      children: [
        for (var post in posts)
          _buildPostItem(post),
      ],
    );
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
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.indigo,
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
                  post.containsKey('title') ? post['title'] : '',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  post.containsKey('desc') ? post['desc'] : '',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        // ! Image
        Center(
          child: Image.network(
            post['picture'],
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildPostFooter(post, user) {
    return // ! Actions
        Row(
      children: [
        // ! Like
        Row(
          children: [
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              bool isLiked = post['likes'].contains('myId');

              return IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                ),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    if (isLiked) {
                      post['likes'].remove('myId');
                    } else {
                      post['likes'].add('myId');
                    }
                  });
                },
              );
            }),
            IconButton(
              icon: Icon(Icons.comment),
              color: Colors.white,
              onPressed: () {
                //print("open comment box");
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
        // Add other actions/buttons here
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
          _buildCommentModalFooter(context),
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

  Container _buildCommentModalFooter(BuildContext context) {
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
                    //setState(() {
                    //  inputValue = newValue;
                    //});
                    print(newValue);
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
                  onPressed: () {
                    print("Gönder");
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
          // Profile Picture
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.green,
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
