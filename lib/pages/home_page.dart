import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';
import 'package:schedule/providers/schedule_provider.dart';
import 'detail_page.dart';
import 'add_schedule_page.dart';

class HomePage extends StatefulWidget {
  final String userId;

  HomePage({required this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final schedules = Provider.of<ScheduleProvider>(context).schedules;

    final filteredSchedules = schedules
        .where((s) =>
    s.date.day == _selectedDate.day &&
        s.date.month == _selectedDate.month &&
        s.date.year == _selectedDate.year)
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userId}님의 일정'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CalendarCarousel(
              onDayPressed: (date, events) {
                setState(() {
                  _selectedDate = date;
                });
              },
              selectedDateTime: _selectedDate,
              weekendTextStyle: TextStyle(
                color: Colors.red,
              ),
              todayButtonColor: Colors.blue,
              selectedDayTextStyle: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
          SizedBox(height: 10), // 여백 추가
          Expanded(
            child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: (ctx, index) {
                final schedule = filteredSchedules[index];
                return ListTile(
                  title: Text(schedule.title),
                  subtitle: Text(
                      '${schedule.date.hour}:${schedule.date.minute.toString().padLeft(2, '0')}'),
                  leading: Icon(schedule.icon),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<ScheduleProvider>(context, listen: false)
                          .deleteSchedule(schedule);
                    },
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DetailPage.routeName, arguments: schedule.date);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddSchedulePage(selectedDate: _selectedDate),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
