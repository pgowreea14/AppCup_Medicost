import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medicalapp/screens/reminder/colo_extension.dart';
import 'package:medicalapp/screens/reminder/round_button.dart';

class SleepAddAlarmView extends StatefulWidget {
  final DateTime date;
  const SleepAddAlarmView({super.key, required this.date});

  @override
  State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
}

class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
  bool positive = false;
  String repeat = 'Daily';

  final TextEditingController medicineController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();

  final _productController = TextEditingController();
  final _productDesController = TextEditingController();

  @override
  void dispose() {
    medicineController.dispose();
    dosageController.dispose();
    noteController.dispose();
    _productController.dispose();
    _productDesController.dispose();
    super.dispose();
  }

  Future<void> addReminder() async {
    final url = Uri.parse(
        'https://g9ffbcf49633931-r4h3m3ix56bxw6ul.adb.af-johannesburg-1.oraclecloudapps.com/ords/admin/medreminder/');

    // Create a map for the reminder data
    final reminderData = {
      'medicinename': medicineController.text,
      'dosage': dosageController.text,
      'startdate': selectedDateTime.toIso8601String(),
      'repeat': repeat,
      'remindernotes': noteController.text,
    };

    // Send POST request
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(reminderData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successfully added reminder
        print('Reminder added successfully!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reminder added successfully!')),
        );
        Navigator.pop(context);
      } else {
        // Handle error
        print('Failed to add reminder: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add reminder')),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Add Reminder",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.more_vert,
                size: 24,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(20),
              height: media.width * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  TColor.primaryColor2.withOpacity(0.4),
                  TColor.primaryColor1.withOpacity(0.4)
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          "Add Your reminders\neach day",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 110,
                          height: 35,
                          child: RoundButton(
                            title: "Learn More",
                            fontSize: 12,
                            onPressed: () {},
                          ),
                        ),
                      ]),
                  Image.asset(
                    "assets/images/progress_each_photo.png",
                    width: media.width * 0.35,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildTextFieldWithIcon(
              header: "Medicine",
              controller: medicineController,
              icon: Icons.camera_alt,
              onIconPressed: () {
                // Implement camera functionality
              },
            ),
            const SizedBox(height: 10),
            _buildTextField(
              header: "Dosage",
              controller: dosageController,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              header: "Note",
              controller: noteController,
            ),
            const SizedBox(height: 10),
            _buildDateTimePicker(
              header: "Time",
              selectedDateTime: selectedDateTime,
              onDateTimeChanged: (DateTime dateTime) {
                setState(() {
                  selectedDateTime = dateTime;
                });
              },
            ),
            const SizedBox(height: 10),
            _buildRepeatRadio(
              header: "Repeat",
              selectedOption: repeat,
              onChanged: (String? value) {
                setState(() {
                  if (value != null) {
                    repeat = value;
                  }
                });
              },
            ),
            const Spacer(),
            RoundButton(
              title: "Add",
              onPressed: addReminder,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required String header,
    required TextEditingController controller,
    required IconData icon,
    required VoidCallback onIconPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: header,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(icon),
                onPressed: onIconPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String header,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimePicker({
    required String header,
    required DateTime selectedDateTime,
    required ValueChanged<DateTime> onDateTimeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: InkWell(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDateTime,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                );

                if (pickedTime != null) {
                  final DateTime newDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  onDateTimeChanged(newDateTime);
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedDateTime.toLocal()}'.split(' ')[0] +
                      ' ${selectedDateTime.toLocal().hour}:${selectedDateTime.toLocal().minute}',
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRepeatRadio({
    required String header,
    required String selectedOption,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio<String>(
              value: 'Daily',
              groupValue: selectedOption,
              onChanged: onChanged,
            ),
            const Text('Daily'),
            Radio<String>(
              value: 'Weekly',
              groupValue: selectedOption,
              onChanged: onChanged,
            ),
            const Text('Weekly'),
          ],
        ),
      ],
    );
  }
}
