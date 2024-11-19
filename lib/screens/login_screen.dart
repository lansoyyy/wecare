import 'package:flutter/material.dart';
import 'package:wecare/screens/admin_home_screen.dart';
import 'package:wecare/screens/recover_password_screen.dart';
import 'package:wecare/widgets/button_widget.dart';
import 'package:wecare/widgets/text_widget.dart';
import 'package:wecare/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  String type;
  LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: widget.type,
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: const Icon(
                Icons.account_circle,
                size: 75,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: widget.type,
              fontSize: 18,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFieldWidget(
                borderColor: Colors.black,
                label: 'Enter Password',
                controller: password,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              label: 'Submit',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AdminHomeScreen()));
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecoverScreen(
                          type: widget.type,
                        )));
              },
              child: TextWidget(
                text: 'Recover Password',
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
