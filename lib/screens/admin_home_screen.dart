import 'package:flutter/material.dart';
import 'package:wecare/screens/calendar_screen.dart';
import 'package:wecare/widgets/text_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: const Icon(Icons.calendar_month_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CalendarScreen()));
          },
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidget(
          text: 'Notifications',
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Today, November 08, 2024',
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 3; i++)
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
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'November 06, 2024',
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 3; i++)
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
