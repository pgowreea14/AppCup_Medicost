import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For date formatting
import 'package:medicalapp/screens/prescriptions/add_prescription.dart';
import 'package:medicalapp/screens/prescriptions/prescription.dart';
import 'package:medicalapp/screens/reminder/round_button.dart';
import 'package:medicalapp/screens/reminder/colo_extension.dart';

class PrescriptionScheduleView extends StatefulWidget {
  const PrescriptionScheduleView({super.key});

  @override
  State<PrescriptionScheduleView> createState() =>
      _PrescriptionScheduleViewState();
}

class _PrescriptionScheduleViewState extends State<PrescriptionScheduleView> {
  List todaySleepArr = [];
  List allReminders = []; // Store all reminders fetched from the API
  bool _isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget initializes
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    const url =
        'https://g9ffbcf49633931-r4h3m3ix56bxw6ul.adb.af-johannesburg-1.oraclecloudapps.com/ords/admin/prescritpion/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List;

        // Print the fetched data to the log
        print('Fetched Data: $items');

        // Store the raw reminders
        allReminders = items;

        // Directly assign to todaySleepArr
        setState(() {
          todaySleepArr = allReminders.map((item) {
            final DateTime startDate = DateTime.parse(item['startdate']);
            final duration = startDate.difference(DateTime.now());

            return {
              "name": item['mednamelines'],
              "image": "assets/images/prescription_icon.png",
              "time": DateFormat('dd/MM/yyyy hh:mm a').format(startDate),
              "duration":
                  "in ${duration.inHours} hours ${duration.inMinutes % 60} minutes",
              "dosage": item['dosage']
            };
          }).toList();
        });
      } else {
        // Handle error response
        print('Failed to load data');
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Medicine Prescription",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      borderRadius: BorderRadius.circular(0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Add Your Medical\nPrescription\nHere",
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
                                  onPressed: () {}),
                            )
                          ]),
                      Image.asset(
                        "assets/images/pres.png",
                        width: media.width * 0.35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                todaySleepArr.isEmpty
                    ? Center(
                        child: Text(
                          "No Prescription available.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: todaySleepArr.length,
                        itemBuilder: (context, index) {
                          var sObj = todaySleepArr[index] as Map? ?? {};
                          return Prescription(
                            sObj: sObj,
                          );
                        },
                      ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(), // Loader widget
            ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addPrescription(),
            ),
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: TColor.white,
          ),
        ),
      ),
    );
  }
}
