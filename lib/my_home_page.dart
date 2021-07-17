import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? file;
  ImagePicker imagePicker = ImagePicker();

  getImage(ImageSource source) async {
    final file = await imagePicker.getImage(source: source);

    setState(() {
      this.file = File(file!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image picker'),
      ),
      body: Container(
        alignment: Alignment.center,
        // height: 200,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: file == null
                  ? Container(
                      height: 200,
                      width: 300,
                      color: Colors.amberAccent,
                    )
                  : Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(file!),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    child: Text('Camera'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Text('Gallery'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
