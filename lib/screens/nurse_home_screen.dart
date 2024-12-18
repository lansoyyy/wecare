import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wecare/widgets/text_widget.dart';
import 'package:wecare/widgets/toast_widget.dart';

class NurseHomeScreen extends StatefulWidget {
  const NurseHomeScreen({super.key});

  @override
  State<NurseHomeScreen> createState() => _NurseHomeScreenState();
}

class _NurseHomeScreenState extends State<NurseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 20),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.timer_outlined),
      //     onPressed: () {
      //       _showTimeSelectorDialog();
      //       // Navigator.of(context).push(MaterialPageRoute(
      //       //     builder: (context) => const CalendarScreen()));
      //     },
      //   ),
      // ),

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/Homepage(all).png',
                ),
                fit: BoxFit.cover),
          ),
          child: StreamBuilder<DatabaseEvent>(
              stream: FirebaseDatabase.instance.ref().onValue,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                List? data = snapshot.data!.snapshot.value as List?;

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          TextWidget(
                            text: 'Notifications',
                            fontSize: 32,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text:
                            'Today, ${DateFormat('MMMM dd, yyyy').format(DateTime.now())}',
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < data!.length; i++)
                        data[i] == null
                            ? const SizedBox()
                            : Builder(builder: (context) {
                                // Parse the text data into DateTime
                                DateTime parsedDateTime = DateTime.parse(data[i]
                                        ['timestamp']
                                    .toString()
                                    .split(' ')[0]);

                                // Get the current date
                                DateTime currentDate = DateTime.now();

                                // Compare the date (ignoring time)
                                bool isSameDay = parsedDateTime.year ==
                                        currentDate.year &&
                                    parsedDateTime.month == currentDate.month &&
                                    parsedDateTime.day == currentDate.day;
                                return isSameDay
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 65,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: data[i]['status'] == 'Taken'
                                                ? Colors.green[300]
                                                : Colors.red[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextWidget(
                                                  text: data[i]['status'] ==
                                                          'Taken'
                                                      ? 'Patients have already taken their medication.'
                                                      : data[i]['status'] ==
                                                              'Missed'
                                                          ? 'Patients missed their scheduled medication.'
                                                          : 'Medication in Comportment 1 is scheduled for 7:00 AM, Please be ready in 30 minutes',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: 'Bold',
                                                ),
                                                Builder(builder: (context) {
                                                  // Split the time string by colon (:) to get the hour, minute, and second
                                                  List<String> parts = data[i]
                                                          ['timestamp']
                                                      .toString()
                                                      .split(' ')[1]
                                                      .split(':');

                                                  // Ensure hour, minute, and second are two digits
                                                  String hour =
                                                      parts[0].padLeft(2, '0');
                                                  String minute =
                                                      parts[1].padLeft(2, '0');
                                                  String second = parts.length >
                                                          2
                                                      ? parts[2].padLeft(2, '0')
                                                      : '00';

                                                  // Convert hour to 12-hour format and determine AM/PM
                                                  int hourInt = int.parse(hour);
                                                  String amPm = hourInt >= 12
                                                      ? 'PM'
                                                      : 'AM';
                                                  hour = (hourInt % 12 == 0
                                                          ? 12
                                                          : hourInt % 12)
                                                      .toString()
                                                      .padLeft(2, '0');

                                                  // Format the time in the desired format
                                                  String formattedTime =
                                                      '$hour:$minute$amPm';
                                                  return TextWidget(
                                                    text: formattedTime,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: TextWidget(
                                          text: 'No available records',
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      );
                              }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: DateFormat('MMMM dd, yyyy').format(
                            DateTime.now().subtract(const Duration(days: 1))),
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < data.length; i++)
                        data[i] == null
                            ? const SizedBox()
                            : Builder(builder: (context) {
                                // Parse the text data into DateTime
                                DateTime parsedDateTime = DateTime.parse(data[i]
                                        ['timestamp']
                                    .toString()
                                    .split(' ')[0]);

                                // Get the current date
                                DateTime currentDate = DateTime.now()
                                    .subtract(const Duration(days: 1));

                                // Compare the date (ignoring time)
                                bool isSameDay = parsedDateTime.year ==
                                        currentDate.year &&
                                    parsedDateTime.month == currentDate.month &&
                                    parsedDateTime.day == currentDate.day;
                                return isSameDay
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 65,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: data[i]['status'] == 'Taken'
                                                ? Colors.green[300]
                                                : Colors.red[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextWidget(
                                                  text: data[i]['status'] ==
                                                          'Taken'
                                                      ? 'Patients have already taken their medication.'
                                                      : data[i]['status'] ==
                                                              'Missed'
                                                          ? 'Patients missed their scheduled medication.'
                                                          : 'Medication in Comportment 1 is scheduled for 7:00 AM, Please be ready in 30 minutes',
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: 'Bold',
                                                ),
                                                Builder(builder: (context) {
                                                  // Split the time string by colon (:) to get the hour, minute, and second
                                                  List<String> parts = data[i]
                                                          ['timestamp']
                                                      .toString()
                                                      .split(' ')[1]
                                                      .split(':');

                                                  // Ensure hour, minute, and second are two digits
                                                  String hour =
                                                      parts[0].padLeft(2, '0');
                                                  String minute =
                                                      parts[1].padLeft(2, '0');
                                                  String second = parts.length >
                                                          2
                                                      ? parts[2].padLeft(2, '0')
                                                      : '00';

                                                  // Convert hour to 12-hour format and determine AM/PM
                                                  int hourInt = int.parse(hour);
                                                  String amPm = hourInt >= 12
                                                      ? 'PM'
                                                      : 'AM';
                                                  hour = (hourInt % 12 == 0
                                                          ? 12
                                                          : hourInt % 12)
                                                      .toString()
                                                      .padLeft(2, '0');

                                                  // Format the time in the desired format
                                                  String formattedTime =
                                                      '$hour:$minute$amPm';
                                                  return TextWidget(
                                                    text: formattedTime,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox();
                              }),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('h:mm a').format(dateTime);
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
              onPressed: () async {
                final formattedMorningTime = _formatTime(morningTime);
                final formattedNoonTime = _formatTime(noonTime);
                final formattedEveningTime = _formatTime(eveningTime);

                DatabaseReference ref =
                    FirebaseDatabase.instance.ref("Schedule");

                await ref.set({
                  "morning": formattedMorningTime,
                  "noon": formattedNoonTime,
                  "evening": formattedEveningTime
                });
                Navigator.pop(context);
                showToast('Time set succesfully!');
              },
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
