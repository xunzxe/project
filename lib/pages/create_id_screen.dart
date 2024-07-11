import 'package:flutter/material.dart';
import 'package:schedule/pages/home_page.dart'; // Updated import

class CreateIdScreen extends StatefulWidget {
  @override
  _CreateIdScreenState createState() => _CreateIdScreenState();
}

class _CreateIdScreenState extends State<CreateIdScreen> {
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 생성'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      userId: _idController.text,
                    ),
                  ),
                );
              },
              child: Text('생성하기'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }
}
