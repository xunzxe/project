import 'package:flutter/material.dart';

class Schedule {
  final DateTime date;
  final String title;
  final IconData icon;

  Schedule({required this.date, required this.title, required this.icon});
}

class ScheduleProvider with ChangeNotifier {
  List<Schedule> _schedules = [];

  List<Schedule> get schedules => _schedules;

  void addSchedule(Schedule schedule) {
    _schedules.add(schedule);
    notifyListeners();
  }

  void deleteSchedule(Schedule schedule) {
    _schedules.remove(schedule);
    notifyListeners();
  }
}
