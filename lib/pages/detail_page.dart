import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final date = ModalRoute.of(context)!.settings.arguments as DateTime;

    return Scaffold(
      appBar: AppBar(
        title: Text('상세 페이지'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${date.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Text(
                    '포스팅\n바로가기',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24), // 글씨 크기 키우기
                  )
                      : Container(
                    height: 200, // 원하는 이미지 높이 설정
                    width: double.infinity,
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
                  SizedBox(height: 20), // 버튼과 이미지 사이에 간격 추가
                  ElevatedButton(
                    onPressed: getImage,
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
