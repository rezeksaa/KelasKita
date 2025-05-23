import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PiketFragment extends StatelessWidget {
  final Map<String, List<String>> piketJadwal = {
    'Monday': ['Alice', 'Bob'],
    'Tuesday': ['Charlie', 'Diana'],
    'Wednesday': ['Eve', 'Frank'],
    'Thursday': ['Grace', 'Heidi'],
    'Friday': ['Ivan', 'Judy'],
  };

  String getToday() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final today = getToday();
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    final currentUser = 'Alice';

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final piketList = piketJadwal[day] ?? [];
          final isToday = day == today;
          final isPiket = piketList.contains(currentUser);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: isToday ? 6 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side:
                  isToday
                      ? BorderSide(color: Colors.blue, width: 2)
                      : BorderSide.none,
            ),
            child: ExpansionTile(
              leading:
                  isToday
                      ? Icon(Icons.today, color: Colors.blue)
                      : Icon(Icons.calendar_today, color: Colors.grey),
              title: Text(
                day,
                style: TextStyle(
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  color: isToday ? Colors.blue : Colors.black,
                ),
              ),
              subtitle: Text('Jumlah Piket: ${piketList.length}'),
              trailing:
                  isPiket
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.arrow_drop_down, color: Colors.grey),
              children:
                  piketList.map((student) {
                    bool isCurrent = student == currentUser;
                    return ListTile(
                      leading: Icon(
                        isCurrent ? Icons.person : Icons.person_outline,
                        color: isCurrent ? Colors.green : Colors.grey,
                      ),
                      title: Text(
                        student,
                        style: TextStyle(
                          fontWeight:
                              isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCurrent ? Colors.green : Colors.black,
                        ),
                      ),
                      trailing:
                          isCurrent
                              ? Icon(Icons.star, color: Colors.amber)
                              : null,
                    );
                  }).toList(),
            ),
          );
        },
      ),
    );
  }
}
