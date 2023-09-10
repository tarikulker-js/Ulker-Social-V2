import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/screens/ProfileScreen.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 95,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(bottom: BorderSide(color: Colors.black, width: 0.2)),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProfileItem({
                "id": 1,
                "name": "Nah Çeken Dayı", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1651493441/aeexa269wrpu3tci4bzq.jpg",
                "following": ["", "", "", "user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1629449605/g4jo0mprt6emvxuwvvz0.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1630306014/gkjxnq3rgxkahlf1onxi.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]            
              }),
              _buildProfileItem({
                "id": 2,
                "name": "Polat & Elif", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1629449695/sko7w3cubxwlellenjjd.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 3,
                "name": "Sigma Polat", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621869493/cqcbcayasumrp5yn999b.png",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 4,
                "name": "Abdül & Güllü", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620039744/lp3o9xafganiplqlm3kg.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 5,
                "name": "Kod Yazan Ergen", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621700606/mwdshz5mkqfy5v48pfib.webp",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 6,
                "name": "Nah Çeken Dayı", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1651493441/aeexa269wrpu3tci4bzq.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 7,
                "name": "Polat & Elif", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1629449695/sko7w3cubxwlellenjjd.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 8,
                "name": "Sigma Polat", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621869493/cqcbcayasumrp5yn999b.png",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 9,
                "name": "Abdül & Güllü", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620039744/lp3o9xafganiplqlm3kg.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 10,
                "name": "Kod Yazan Ergen", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621700606/mwdshz5mkqfy5v48pfib.webp",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 11,
                "name": "Nah Çeken Dayı", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1651493441/aeexa269wrpu3tci4bzq.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 12,
                "name": "Polat & Elif", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1629449695/sko7w3cubxwlellenjjd.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 13,
                "name": "Sigma Polat", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621869493/cqcbcayasumrp5yn999b.png",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 14,
                "name": "Abdül & Güllü", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1620039744/lp3o9xafganiplqlm3kg.jpg",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
              _buildProfileItem({
                "id": 15,
                "name": "Kod Yazan Ergen", 
                "pic": "http://res.cloudinary.com/doaf7ybhd/image/upload/v1621700606/mwdshz5mkqfy5v48pfib.webp",
                "following": ["user", "user", "user", "user", "user", "user"],
                "followers": ["user", "user", "user", "user", "user", "user", "user", "user", "user", "user"],
                "posts": [
                  {
                    "id": "1",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "2",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "3",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                  {
                    "id": "4",
                    "title": "Title",
                    "body": "Description",
                    "picture": "https://cdn.statically.io/img/timelinecovers.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg",
                    "likes": [
                      "608fd3d9fd53aa01d522c8c1",
                      "608fd3d9fd53aa01d522c8c2",
                      "608fd3d9fd53aa01d522c8c3",
                      "608fd3d9fd53aa01d522c8c4",
                      "608fd3d9fd53aa01d522c8c5",
                    ],
                    
                  },
                ]
            
              }),
            ],
          ),
        );
  }

  Widget _buildProfileItem(user) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () async {
          print("Go to profile " + user['name']);
          var result = await Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) => ProfileScreen(user: user)));
          
          if (result) {
            print("Back to main screen");
          } 
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              Stack (
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: user['id'],
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(user['pic']),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
      
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all( color: Colors.white, width: 2)
      
                    ),
                  )
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  user['name'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
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