import 'package:flutter/material.dart';

class Subject {
  final String title;
  final String teacher;
  final String imageUrl;
  final int meetings;
  final String time;

  Subject({
    required this.title,
    required this.teacher,
    required this.imageUrl,
    required this.meetings,
    required this.time,
  });
}

class HomeFragmentAdmin extends StatefulWidget {
  const HomeFragmentAdmin({Key? key}) : super(key: key);

  @override
  State<HomeFragmentAdmin> createState() => _HomeFragmentAdminState();
}

class _HomeFragmentAdminState extends State<HomeFragmentAdmin> {
  final List<Subject> subjects = [
    Subject(
      title: 'Matematika',
      teacher: 'Zainul Abidin, S.Kom, Gr.',
      imageUrl: 'assets/Math.png',
      meetings: 2,
      time: '08:45–10.15',
    ),
    Subject(
      title: 'Bahasa Inggris',
      teacher: 'Siti Aminah, M.Pd',
      imageUrl: 'assets/english.png',
      meetings: 3,
      time: '10:30–12.00',
    ),
  ];

  void _showAddSubjectDialog() {
    final _titleController = TextEditingController();
    final _teacherController = TextEditingController();
    final _imageUrlController = TextEditingController();
    final _meetingsController = TextEditingController();
    final _timeController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Tambah Mata Pelajaran'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Mata Pelajaran',
                    ),
                  ),
                  TextField(
                    controller: _teacherController,
                    decoration: const InputDecoration(labelText: 'Nama Guru'),
                  ),
                  TextField(
                    controller: _imageUrlController,
                    decoration: const InputDecoration(labelText: 'URL Gambar'),
                  ),
                  TextField(
                    controller: _meetingsController,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Pertemuan',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _timeController,
                    decoration: const InputDecoration(labelText: 'Waktu'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isNotEmpty &&
                      _teacherController.text.isNotEmpty &&
                      _imageUrlController.text.isNotEmpty &&
                      _meetingsController.text.isNotEmpty &&
                      _timeController.text.isNotEmpty) {
                    setState(() {
                      subjects.add(
                        Subject(
                          title: _titleController.text,
                          teacher: _teacherController.text,
                          imageUrl: _imageUrlController.text,
                          meetings: int.tryParse(_meetingsController.text) ?? 1,
                          time: _timeController.text,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Tambah'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SubjectCard(subject: subject),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSubjectDialog,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Tambah Mata Pelajaran',
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.shade100),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              subject.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 120,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 40),
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subject.teacher,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.event_note,
                          size: 18,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text('${subject.meetings}'),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Text(
                      subject.time,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
