import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule/pages/create_id_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 120,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              '일정기록앱 환영합니다!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateIdScreen(),
                  ),
                );
              },
              child: Text('시작하기'),
            ),
          ],
        ),
      ),
    );
  }
}
