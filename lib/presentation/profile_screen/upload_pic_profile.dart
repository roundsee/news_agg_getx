/*
import 'package:flutter/material.dart';
import 'package:easyupload_image_toserver/easyupload_image_toserver_mob.dart';
class Home extends StatelessWidget {
   Home({super.key});
  @override
  Widget build(BuildContext context) {
    UploadImageforPhone upload = UploadImageforPhone();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'test upload',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  // for gallery
                  upload.selectFromGallary();
                  // for gcamallery
                  upload.selectFromCam();
                },
                child: const Text('upload'),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  //upload to server just image
                  upload.uploadToServerWithImageWithOnly(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {} //header if exist in api
                  );
                  upload.uploadToServerWithImageWithBody(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {"key": "value"}, //body of api
                      {} //header if exist in api
                  );
                },
                child: const Text('upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }}
  */