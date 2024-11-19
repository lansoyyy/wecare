import 'package:flutter/material.dart';
import 'package:wecare/screens/calendar_screen.dart';
import 'package:wecare/widgets/text_widget.dart';

class ReportsScreen extends StatelessWidget {
  String date;

  ReportsScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: date,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < 8; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Title of notifications.',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                        TextWidget(
                          text: '07:59AM',
                          fontSize: 12,
                          color: Colors.black,
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
