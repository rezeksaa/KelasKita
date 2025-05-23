import 'package:flutter/material.dart';
import 'package:kelas_kita/GreetingScreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelaskita',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: Greetingscreen(),
    );
  }
}
