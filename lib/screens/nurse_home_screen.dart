import 'package:flutter/material.dart';
import 'package:wecare/screens/calendar_screen.dart';
import 'package:wecare/widgets/text_widget.dart';

class NurseHomeScreen extends StatefulWidget {
  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: const Icon(Icons.timer_outlined),
          onPressed: () {
            _showTimeSelectorDialog();
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const CalendarScreen()));
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

  TimeOfDay morningTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay noonTime = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay eveningTime = const TimeOfDay(hour: 18, minute: 0);

  Future<void> _selectTime(BuildContext context, TimeOfDay initialTime,
      Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  }

  void _showTimeSelectorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTimePickerRow(
                context,
                label: 'MORNING',
                selectedTime: morningTime,
                onTimeChanged: (time) => setState(() => morningTime = time),
              ),
              const SizedBox(height: 16),
              _buildTimePickerRow(
                context,
                label: 'NOON',
                selectedTime: noonTime,
                onTimeChanged: (time) => setState(() => noonTime = time),
              ),
              const SizedBox(height: 16),
              _buildTimePickerRow(
                context,
                label: 'EVENING',
                selectedTime: eveningTime,
                onTimeChanged: (time) => setState(() => eveningTime = time),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimePickerRow(
    BuildContext context, {
    required String label,
    required TimeOfDay selectedTime,
    required Function(TimeOfDay) onTimeChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () => _selectTime(context, selectedTime, onTimeChanged),
          child: Text(
            selectedTime.format(context),
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
