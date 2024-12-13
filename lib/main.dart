import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wecare/firebase_options.dart';
import 'package:wecare/screens/splash_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'wecare-65e9b',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'We Care',
      home: SplashScreen(),
    );
  }
}
