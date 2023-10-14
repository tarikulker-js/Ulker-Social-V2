import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:ulkersocialv2/screens/ExploreScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File? _selectedImage;
  String? _selectedImageUrl;
  String? title;
  String? description;
  bool? loading = false;

  final picker = ImagePicker();

  final secureStorage = SecureStorage();

  Future<void> uploadImageToCloudinary(File imageFile) async {
    final cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/doaf7ybhd/image/upload';

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
      'upload_preset': 'tut_social',
      'cloud_name': 'doaf7ybhd'
    });

    try {
      Response response = await Dio().post(cloudinaryUrl, data: formData);
      if (response.statusCode == 200) {
        print('Resim yükleme başarılı: ${response.data['url']}');

        setState(() {
          if (response.data['url'] != null) {
            _selectedImageUrl = response.data['url'];
          }
        });
      } else {
        print('Resim yükleme başarısız: ${response.data}');
      }
    } catch (e) {
      print('Resim yükleme hatası: $e');
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      }
    });
    /*bool hasPermission = await Permission.photos.isGranted;
    print(hasPermission);

    if (hasPermission) {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedImage != null) {
          _selectedImage = File(pickedImage.path);
        }
      });
    } else {
      await Permission.photos.request();
    }*/
  }

  checkTexts(text) {
    if (text != null) {
      final arabicCharacters = RegExp(r'[\u0600-\u06FF]+');

      return arabicCharacters.hasMatch(text);
    } else
      return false;
  }

  void createPost() async {
    if (checkTexts(title) || checkTexts(description)) {
      ToastMessage(context, "Yallah arabistana", "Araplar giremez, yallah arabistana.");
      return;
    } else {
      setState(() {
        loading = true;
      });

      var token = await secureStorage.read('token');
      if (_selectedImage != null) {
        await uploadImageToCloudinary(_selectedImage!);
      }

      final response = await http.post(
        Uri.parse(
            "https://ulker-social-backend.tarikadmin35.repl.co/createpost"),
        headers: {
          "Content-Type": "application/json",
          'authorization': '$token'
        },
        body: json.encode({
          'title': title,
          'body': description,
          'pic': _selectedImageUrl,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        });
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => ExploreScreen()));
      } else {
        print(response.body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Yeni Gönderi Oluştur'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _getImageFromGallery,
              child: _selectedImage == null
                  ? Center(
                      child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.white,
                    ))
                  : Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.file(_selectedImage!, height: 200),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                labelText: "Başlık",
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 4,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                labelText: "İçerik",
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading == false ? createPost : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  loading == false ? 'Oluştur' : 'Yükleniyor...',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
