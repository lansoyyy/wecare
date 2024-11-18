import 'package:flutter/material.dart';
import 'package:wecare/widgets/button_widget.dart';
import 'package:wecare/widgets/text_widget.dart';
import 'package:wecare/widgets/textfield_widget.dart';

class RecoverScreen extends StatefulWidget {
  String type;
  RecoverScreen({super.key, required this.type});

  @override
  State<RecoverScreen> createState() => _RecoverScreenState();
}

class _RecoverScreenState extends State<RecoverScreen> {
  final num = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Recover Password',
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
                label: 'Enter Phone Number',
                controller: num,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              label: 'Send Code',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
