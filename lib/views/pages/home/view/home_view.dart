import 'package:flutter/material.dart';
import 'package:getx_started/views/pages/daily/widget/daily_list_widget.dart';
import 'package:getx_started/views/pages/home/widget/total_deaths_widget.dart';
import 'package:getx_started/views/pages/home/widget/total_patients_widget.dart';
import 'package:getx_started/views/pages/home/widget/total_tests_widget.dart';

class HomeViewPage extends StatefulWidget {
  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TotalTestsWidget(),
              SizedBox(height: 10),
              TotalPatientsWidget(),
              SizedBox(height: 10),
              TotalDeathWidget(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
