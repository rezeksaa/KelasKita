import 'package:flutter/material.dart';

class Assignment {
  final String subject;
  final String title;
  final String detail;
  final bool isFinished;

  Assignment({
    required this.subject,
    required this.title,
    required this.detail,
    this.isFinished = false,
  });
}

class AssignmentFragmentAdmin extends StatefulWidget {
  @override
  State<AssignmentFragmentAdmin> createState() =>
      _AssignmentFragmentAdminState();
}

class _AssignmentFragmentAdminState extends State<AssignmentFragmentAdmin> {
  final List<Assignment> assignments = [
    Assignment(
      subject: 'Math',
      title: 'Algebra Homework',
      detail: 'Solve 10 algebra problems from page 42.',
      isFinished: true,
    ),
    Assignment(
      subject: 'Math',
      title: 'Geometry Project',
      detail: 'Create a model of a geometric shape.',
      isFinished: false,
    ),
    Assignment(
      subject: 'English',
      title: 'Essay Writing',
      detail: 'Write an essay about your favorite book.',
      isFinished: false,
    ),
    Assignment(
      subject: 'English',
      title: 'Grammar Worksheet',
      detail: 'Complete the grammar worksheet on tenses.',
      isFinished: true,
    ),
  ];

  final List<String> subjects = ['Math', 'English'];

  String _getSubjectImage(String subject) {
    switch (subject.toLowerCase()) {
      case 'math':
        return 'assets/Math.png';
      case 'english':
        return 'assets/english.png';
      default:
        return '';
    }
  }

  void _showAddAssignmentDialog(String subject) {
    final _titleController = TextEditingController();
    final _detailController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Add Assignment for $subject'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _detailController,
                  decoration: InputDecoration(labelText: 'Detail'),
                  maxLines: 2,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isNotEmpty &&
                      _detailController.text.isNotEmpty) {
                    setState(() {
                      assignments.add(
                        Assignment(
                          subject: subject,
                          title: _titleController.text,
                          detail: _detailController.text,
                        ),
                      );
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Assignment>> grouped = {};
    for (var assignment in assignments) {
      grouped.putIfAbsent(assignment.subject, () => []).add(assignment);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children:
            subjects.map((subject) {
              final subjectAssignments = grouped[subject] ?? [];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (subject.toLowerCase() == 'math' ||
                        subject.toLowerCase() == 'english')
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: SizedBox(
                          height: 180,
                          child: Image.asset(
                            _getSubjectImage(subject),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ListTile(
                      title: Text(
                        subject,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        tooltip: 'Add Assignment',
                        onPressed: () => _showAddAssignmentDialog(subject),
                      ),
                    ),
                    ...subjectAssignments.map((assignment) {
                      return ExpansionTile(
                        title: Row(
                          children: [
                            Expanded(child: Text(assignment.title)),
                            Icon(
                              assignment.isFinished
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color:
                                  assignment.isFinished
                                      ? Colors.green
                                      : Colors.grey,
                              size: 20,
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(assignment.detail),
                          ),
                        ],
                      );
                    }).toList(),
                    if (subjectAssignments.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('No assignments yet.'),
                      ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
