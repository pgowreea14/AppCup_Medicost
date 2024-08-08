import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For date formatting
import 'package:medicalapp/screens/reminder/round_button.dart';

import 'notification_service.dart'; // Import the notification service
import 'package:medicalapp/screens/reminder/colo_extension.dart';
import 'package:medicalapp/screens/reminder/sleep_add_alarm_view.dart';
import 'package:medicalapp/screens/reminder/today_sleep_schedule_row.dart';

class SleepScheduleView extends StatefulWidget {
  const SleepScheduleView({super.key});

  @override
  State<SleepScheduleView> createState() => _SleepScheduleViewState();
}

class _SleepScheduleViewState extends State<SleepScheduleView> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;
  final NotificationService _notificationService = NotificationService();

  List todaySleepArr = [];
  List allReminders = []; // Store all reminders fetched from the API
  bool _isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _notificationService.init(); // Initialize the notification service
    fetchData(); // Fetch data when the widget initializes
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    const url =
        'https://g9ffbcf49633931-r4h3m3ix56bxw6ul.adb.af-johannesburg-1.oraclecloudapps.com/ords/admin/medreminder/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List;

        // Store the raw reminders to filter later
        allReminders = items;

        print('ALL REMINDER : ${allReminders}');

        // Filter reminders based on the initial selected date
        filterRemindersByDate(_selectedDateAppBBar);
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

  void filterRemindersByDate(DateTime selectedDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    setState(() {
      todaySleepArr = allReminders.where((item) {
        final DateTime startDate = DateTime.parse(item['startdate']);
        return formatter.format(startDate) == formatter.format(selectedDate);
      }).map((item) {
        final DateTime startDate = DateTime.parse(item['startdate']);
        final duration = startDate.difference(DateTime.now());

        // Schedule a notification for the reminder
        _notificationService.scheduleNotification(
          id: item['id'],
          title: item['medicinename'],
          body: 'It\'s time to take your medicine.',
          scheduledDate: startDate,
        );

        return {
          "name": item['medicinename'],
          "image": "assets/images/pill.png",
          "time": DateFormat('dd/MM/yyyy hh:mm a').format(startDate),
          "duration":
              "in ${duration.inHours} hours ${duration.inMinutes % 60} minutes",
        };
      }).toList();
    });
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
          "Medicine Reminder",
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
                                  onPressed: () {}),
                            )
                          ]),
                      Image.asset(
                        "assets/images/progress_each_photo.png",
                        width: media.width * 0.35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                CalendarAgenda(
                  controller: _calendarAgendaControllerAppBar,
                  appbar: false,
                  selectedDayPosition: SelectedDayPosition.center,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  training: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  weekDay: WeekDay.short,
                  dayNameFontSize: 12,
                  dayNumberFontSize: 16,
                  dayBGColor: Colors.grey.withOpacity(0.15),
                  titleSpaceBetween: 15,
                  backgroundColor: Colors.transparent,
                  fullCalendarScroll: FullCalendarScroll.horizontal,
                  fullCalendarDay: WeekDay.short,
                  selectedDateColor: Colors.white,
                  dateColor: Colors.black,
                  locale: 'en',
                  initialDate: DateTime.now(),
                  calendarEventColor: TColor.primaryColor2,
                  firstDate: DateTime.now().subtract(const Duration(days: 140)),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDateAppBBar = date;
                    });
                    filterRemindersByDate(date);
                  },
                  selectedDayLogo: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: TColor.primaryG,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                todaySleepArr.isEmpty
                    ? Center(
                        child: Text(
                          "No reminders for this date.",
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
                          return TodaySleepScheduleRow(
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
              builder: (context) => SleepAddAlarmView(
                date: _selectedDateAppBBar,
              ),
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
