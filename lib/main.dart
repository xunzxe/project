import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/providers/schedule_provider.dart';
import 'package:schedule/pages/home_page.dart';
import 'package:schedule/pages/detail_page.dart';
import 'package:schedule/pages/onboarding_screen.dart';
import 'package:schedule/pages/create_id_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScheduleProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => OnboardingScreen(),
        '/home': (ctx) => HomePage(userId: 'default_user'),
        DetailPage.routeName: (ctx) => DetailPage(),
        '/createId': (ctx) => CreateIdScreen(),
      },
    );
  }
}
