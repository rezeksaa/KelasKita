import 'package:flutter/material.dart';
import 'package:kelas_kita/RegisterScreen.dart';

class Greetingscreen extends StatelessWidget {
  const Greetingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 32, left: 32, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Kelas',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 195, 160, 100),
                  ),
                ),
                const Text(
                  'kita',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color.fromRGBO(0, 195, 160, 100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: const Text(
                'Kelas belajar nyaman',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  'assets/Rectangle.png',
                  height: 48,
                  fit: BoxFit.contain,
                  width: 280,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: const Text(
                    'Inspiratif',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Memudahkan manajemen dan interaksi kelas',
              style: TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, 25),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -80),
                        child: Transform.rotate(
                          angle: -0.35,
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 39, 140, 126),
                              borderRadius: BorderRadius.circular(64),
                            ),
                          ),
                        ),
                      ),
                      Image.asset('assets/student.png', height: 400),
                      Positioned(
                        bottom: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 39, 140, 126),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 20,
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Join Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
