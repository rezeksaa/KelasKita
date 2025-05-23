import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PiketFragmentAdmin extends StatefulWidget {
  @override
  _PiketFragmentAdminState createState() => _PiketFragmentAdminState();
}

class _PiketFragmentAdminState extends State<PiketFragmentAdmin> {
  final Map<String, List<String>> piketJadwal = {
    'Monday': ['Alice', 'Bob'],
    'Tuesday': ['Charlie', 'Diana'],
    'Wednesday': ['Eve', 'Frank'],
    'Thursday': ['Grace', 'Heidi'],
    'Friday': ['Ivan', 'Judy'],
    'Saturday': ['Ivan', 'Judy'],
  };

  Map<String, bool> piketStatus = {};

  String getToday() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  @override
  void initState() {
    super.initState();
    final today = getToday();
    final todayList = piketJadwal[today] ?? [];
    piketStatus = {for (var student in todayList) student: false};
  }

  @override
  Widget build(BuildContext context) {
    final today = getToday();
    final todayList = piketJadwal[today] ?? [];

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blue, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.today, color: Colors.blue),
                title: Text(
                  today,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text('Jumlah Piket: ${todayList.length}'),
              ),
              Divider(),
              ...todayList.map((student) {
                return CheckboxListTile(
                  title: Text(
                    student,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  value: piketStatus[student] ?? false,
                  onChanged: (val) {
                    setState(() {
                      piketStatus[student] = val ?? false;
                    });
                  },
                  secondary: Icon(
                    piketStatus[student] == true
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color:
                        piketStatus[student] == true
                            ? Colors.green
                            : Colors.grey,
                  ),
                  activeColor: Colors.green,
                );
              }).toList(),
              if (todayList.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tidak ada jadwal piket hari ini.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
