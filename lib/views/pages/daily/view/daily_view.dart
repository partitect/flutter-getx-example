import 'package:flutter/material.dart';
import 'package:getx_started/views/pages/daily/widget/daily_list_widget.dart';

class DailyViewScreen extends StatefulWidget {
  @override
  _DailyViewScreenState createState() => _DailyViewScreenState();
}

class _DailyViewScreenState extends State<DailyViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: DailyListWidget(),
      ),
    );
  }
}
