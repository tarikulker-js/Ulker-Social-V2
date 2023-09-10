import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File? _selectedImage;
  String? _selectedImageUrl;
  String? title;
  String? description;

  final picker = ImagePicker();

  Future<void> uploadImageToCloudinary(File imageFile) async {
    final cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/doaf7ybhd/image/upload';

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
      'upload_preset': 'tut_social',
      'cloud_name': 'doaf7ybhd'
    });

    print(formData);

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
    print("open gallery");
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      }
    });
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
                  ? Center(child: Icon(Icons.add_a_photo, size: 50, color: Colors.white,))
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
                    borderSide:
                        BorderSide(color: Colors.white, width: 0.0)),
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
                borderSide:
                    BorderSide(color: Colors.white, width: 0.0)),
                labelText: "Yorumunuz",
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Post oluşturma işlemleri burada gerçekleştirilebilir.
            
                  if (_selectedImage != null) {
                    await uploadImageToCloudinary(_selectedImage!);
                  }
            
                  print(title);
                  print(description);
                  print(_selectedImageUrl);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Oluştur',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
