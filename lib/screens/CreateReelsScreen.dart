// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ulkersocialv2/components/AppBar.dart';
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:ulkersocialv2/screens/ReelsScreen.dart';
import 'package:ulkersocialv2/storage/SecureStorage.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class CreateReelsScreen extends StatefulWidget {
  @override
  _CreateReelsScreenState createState() => _CreateReelsScreenState();
}

class _CreateReelsScreenState extends State<CreateReelsScreen> {
  File? _selectedVideo;
  String? _selectedVideoUrl;

  String description = "";

  bool loading = false;

  VideoPlayerController? _videoController;
  var _initializeVideoPlayerFuture;

  int _currentStep = 0;
  final picker = ImagePicker();
  final secureStorage = SecureStorage();
  ImageSource source = ImageSource.gallery;
  double uploadedPercentage = 0;

  Future<void> _getVideoFromGallery() async {
    if (_selectedVideo != null) {
      _videoController?.pause();
    }
    final pickedVideo = await picker.pickVideo(source: source);

    setState(() {
      if (pickedVideo != null) {
        _selectedVideo = File(pickedVideo.path);
      }
    });

    if (pickedVideo?.path != null) {
      _videoController = VideoPlayerController.file(File(pickedVideo!.path));
      _videoController?.initialize();
      _videoController?.setLooping(true);
      _videoController?.play();
    }

    /*bool hasPermission = await Permission.photos.isGranted;
    print(hasPermission);

    if (hasPermission) {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedImage != null) {
          _selectedVideo = File(pickedImage.path);
        }
      });
    } else {
      await Permission.photos.request();
    }*/
  }

  @override
  void dispose() {
    if (_videoController?.value?.isInitialized == false) {
      _videoController?.dispose();
      _videoController?.pause();
    }
    super.dispose();
  }

  Step uploadVideoStep() {
    return Step(
      title: const Text(
        'Video Yükleyin',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          setState(() {
                            source = ImageSource.gallery;
                          });

                          _getVideoFromGallery();
                        },
                        child: Text("Galeri"),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          setState(() {
                            source = ImageSource.camera;
                          });

                          _getVideoFromGallery();
                        },
                        child: Text("Kamera"),
                      ),
                    ],
                  ),
                );
              },
              child: _selectedVideo != null
                  ? Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 16,
                        child: VideoPlayer(_videoController!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                  : Row(
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Video Yükleyin',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      isActive: _currentStep >= 0,
      state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
    );
  }

  Step contentStep() {
    return Step(
      title: const Text(
        'İçerik',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        children: loading ? [
          CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 13.0,
                animation: false,
                percent: uploadedPercentage / 100,
                center: Text(
                  "${uploadedPercentage.toStringAsFixed(2)}%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
                ),
                footer: Text(
                  uploadedPercentage < 100 ? "Video Yükleniyor..." : "Reels Yükleniyor...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
              ),
        ] : [
          TextField(
            onChanged: (newValue) => setState(() => description = newValue),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0)),
              labelText: "Açıklama",
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      isActive: _currentStep >= 0,
      state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }

  tapped(int step) {
    if (_selectedVideoUrl == null && !loading) {
      setState(() => _currentStep = step);

      print(_currentStep);
      if (_currentStep == 0) {
        _videoController?.play();
      }
    }
  }

  continued() {
    if (_currentStep == 1) {
      createReel();
    }

    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
    _videoController?.pause();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Future<void> uploadVideoToCloudinary(File videoFile) async {
  print("${videoFile.path} yükleniyor...");
  final cloudinaryUrl = 'https://api.cloudinary.com/v1_1/doaf7ybhd/video/upload';

  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(videoFile.path),
    'upload_preset': 'tut_social',
    'cloud_name': 'doaf7ybhd',
    'resource_type': 'auto'
  });

  Dio dio = Dio();
  try {
    Response response = await dio.post(cloudinaryUrl, data: formData, onSendProgress: (uploaded, total) {
      setState(() {
        uploadedPercentage = ((uploaded / total) * 100);
      });
    },);
    if (response.statusCode == 200) {
      print('Video yükleme başarılı: ${response.data['url']}');

      setState(() {
        if (response.data['url'] != null) {
          _selectedVideoUrl = response.data['url'];
        }
      });
    } else {
      ToastMessage(context, "Reels Yüklenirken Hata!", json.decode(response.data).toString(), type: "error");
      print('Video yükleme başarısız: ${response.data}');
    }
  } catch (e) {
    ToastMessage(context, "Reels Yüklenirken Hata!", e.toString(), type: "error");
    print('Video yükleme hatası: $e');
  }
}


  checkTexts(text) {
    if (text != null) {
      final arabicCharacters = RegExp(r'[\u0600-\u06FF]+');

      return arabicCharacters.hasMatch(text);
    } else
      return false;
  }

  createReel() async {
    if (loading) {
      return;
    }

    if (checkTexts(description)) {
      ToastMessage(
          context, "Yallah arabistana", "Araplar giremez, yallah arabistana.");
      return;
    } else {
      print("create");
      setState(() {
        loading = true;
      });

      var token = await secureStorage.read('token');

      if (_selectedVideo != null && _selectedVideoUrl == null) {
        await uploadVideoToCloudinary(_selectedVideo!);
      }

      final response = await http.post(
        Uri.parse(
            "https://ulker-social-backend.tarikadmin35.repl.co/createreels"),
        headers: {
          "Content-Type": "application/json",
          'authorization': '$token'
        },
        body: json.encode({
          'title': description,
          'video': _selectedVideoUrl,
        }),
      );
      setState(() {
        loading = false;
      });

      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (BuildContext context) => ReelsScreen()), (route) => false);
      } else {
        print(response.body);

        ToastMessage(context, "Reels Yüklenirken Hata!", json.decode(response.body)['error'], type: "error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Ulker Social V2",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            if (_currentStep == 0) {
              _videoController?.dispose();
              _videoController = null;
              Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (BuildContext context) => ReelsScreen()), (router) => false);
            } else {
              cancel();
            }
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                  canvasColor: Colors.black,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.orange,
                        secondary: Colors.orange,
                      ),
                ),
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  controlsBuilder: _selectedVideo != null
                      ? null
                      : (context, details) => SizedBox(),
                  steps: <Step>[
                    uploadVideoStep(),
                    contentStep(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
