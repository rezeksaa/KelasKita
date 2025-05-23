import 'package:flutter/material.dart';
import 'package:kelas_kita/AdminFragments/AssignmentFragmentAdmin.dart';
import 'package:kelas_kita/AdminFragments/HomeFragmentAdmin.dart';
import 'package:kelas_kita/AdminFragments/KasFragmentAdmin.dart';
import 'package:kelas_kita/AdminFragments/PiketFragmentAdmin.dart';
import 'package:kelas_kita/Fragments/AssignmentFragment';
import 'package:kelas_kita/Fragments/HomeFragment.dart';
import 'package:kelas_kita/Fragments/KasFragment.dart';
import 'package:kelas_kita/Fragments/PiketFragment.dart' hide Text;

class ClassPage extends StatefulWidget {
  final String ClassName;

  const ClassPage({Key? key, required this.ClassName}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeFragmentAdmin(),
    AssignmentFragmentAdmin(),
    KasFragmentAdmin(),
    PiketFragmentAdmin(),
  ];

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).maybePop();
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(widget.ClassName, style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: Color(0xFF219080),
          unselectedItemColor: Colors.black54,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Tugas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Kas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Piket',
            ),
          ],
        ),
      ),
    );
  }
}
