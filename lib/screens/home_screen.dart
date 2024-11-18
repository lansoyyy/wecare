import 'package:flutter/material.dart';
import 'package:wecare/screens/login_screen.dart';
import 'package:wecare/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Select Profile:',
              fontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(
                          type: 'Admin',
                        )));
              },
              child: const Icon(
                Icons.account_circle,
                size: 75,
              ),
            ),
            TextWidget(
              text: 'Admin',
              fontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(
                          type: 'Head Nurse',
                        )));
              },
              child: const Icon(
                Icons.account_circle,
                size: 75,
              ),
            ),
            TextWidget(
              text: 'Head Nurse',
              fontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(
                          type: 'Staff',
                        )));
              },
              child: const Icon(
                Icons.account_circle,
                size: 75,
              ),
            ),
            TextWidget(
              text: 'Staff',
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
