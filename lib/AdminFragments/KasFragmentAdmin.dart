import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Student {
  final int nomorAbsen;
  final String name;
  bool hasPaid;
  int kasBelumDibayar;

  Student({
    required this.nomorAbsen,
    required this.name,
    required this.hasPaid,
    required this.kasBelumDibayar,
  });
}

final List<Student> students = [
  Student(nomorAbsen: 1, name: 'Alice', hasPaid: true, kasBelumDibayar: 0),
  Student(nomorAbsen: 2, name: 'Bob', hasPaid: false, kasBelumDibayar: 10000),
  Student(nomorAbsen: 3, name: 'Charlie', hasPaid: true, kasBelumDibayar: 0),
  Student(nomorAbsen: 4, name: 'Diana', hasPaid: false, kasBelumDibayar: 5000),
  Student(nomorAbsen: 5, name: 'Evan', hasPaid: true, kasBelumDibayar: 0),
];

class KasFragmentAdmin extends StatefulWidget {
  const KasFragmentAdmin({Key? key}) : super(key: key);

  @override
  State<KasFragmentAdmin> createState() => _KasFragmentAdminState();
}

class _KasFragmentAdminState extends State<KasFragmentAdmin> {
  late List<Student> _students;

  @override
  void initState() {
    super.initState();
    _students =
        students
            .map(
              (s) => Student(
                nomorAbsen: s.nomorAbsen,
                name: s.name,
                hasPaid: s.hasPaid,
                kasBelumDibayar: s.kasBelumDibayar,
              ),
            )
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    final String today = DateFormat(
      'EEEE, dd MMMM yyyy',
    ).format(DateTime.now());

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              today,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return ListTile(
                  title: Row(
                    children: [
                      Text(
                        '${student.nomorAbsen}. ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(student.name),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed:
                            student.kasBelumDibayar == 0
                                ? null
                                : () {
                                  setState(() {
                                    student.kasBelumDibayar -= 5000;
                                    if (student.kasBelumDibayar <= 0) {
                                      student.kasBelumDibayar = 0;
                                      student.hasPaid = true;
                                    } else {
                                      student.hasPaid = false;
                                    }
                                  });
                                },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              student.kasBelumDibayar == 0
                                  ? Colors.grey
                                  : Colors.blue,
                        ),
                        child: const Text(
                          '- Rp5.000',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            student.kasBelumDibayar += 5000;
                            student.hasPaid = student.kasBelumDibayar == 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text(
                          '+ Rp5.000',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.hasPaid ? 'Sudah bayar' : 'Belum bayar',
                        style: TextStyle(
                          color: student.hasPaid ? Colors.green : Colors.red,
                        ),
                      ),
                      Text(
                        'Jumlah kas belum dibayar: Rp${student.kasBelumDibayar}',
                        style: TextStyle(
                          color:
                              student.kasBelumDibayar == 0
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
