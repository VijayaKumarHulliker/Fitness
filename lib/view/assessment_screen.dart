

import 'package:fitness/view/my_appoinments.dart';
import 'package:fitness/view/my_assessment.dart';
import 'package:flutter/material.dart';


class Assessment extends StatefulWidget {
  const Assessment({super.key});

  @override
  State<Assessment> createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Hello Jane",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 30),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.white, // Change app bar color to match the background
        elevation: 0, // Remove shadow
      ),
      body: Column(
        children: [
          // Rounded container with tabs inside
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: screenHeight * 0.08, // Set height as 8% of the screen height
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 245, 243), // Background color of the container
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0), // Padding inside the container
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white, // Selected tab background color
                    borderRadius: BorderRadius.circular(25), // Rounded corners for selected tab
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Makes the indicator wider
                  indicatorSize: TabBarIndicatorSize.tab, // Sets indicator size to match the tab width
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20.0), // Adds padding between the tabs
                  labelColor: Colors.blue, // Selected tab text color
                  unselectedLabelColor: Colors.grey, 
                  // Unselected tab text color
                  
                  tabs: const [
                    Tab(text: 'My Assessment'),
                    Tab(text: 'My Appointments'),
                  ],
                ),
              ),
            ),
          ),
          // TabBarView to show the content of the tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyAssessment(), // Use the widget from my_assessment.dart
                MyAppointments(), // Use the widget from my_appointments.dart
              ],
            ),
          ),
        ],
      ),
    );
  }
}
