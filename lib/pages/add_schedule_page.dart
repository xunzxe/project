import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';

class AddSchedulePage extends StatefulWidget {
  final DateTime selectedDate;

  AddSchedulePage({required this.selectedDate});

  @override
  _AddSchedulePageState createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _titleController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일정 추가'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '일정명'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: '시간',
                ),
                child: Text(
                  _selectedTime.format(context),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                if (title.isEmpty) {
                  return;
                }

                final DateTime scheduleDateTime = DateTime(
                  widget.selectedDate.year,
                  widget.selectedDate.month,
                  widget.selectedDate.day,
                  _selectedTime.hour,
                  _selectedTime.minute,
                );

                Provider.of<ScheduleProvider>(context, listen: false).addSchedule(
                  Schedule(date: scheduleDateTime, title: title, icon: Icons.event),
                );

                Navigator.of(context).pop();
              },
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}
