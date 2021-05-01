import 'package:flutter/material.dart';
import 'package:getx_started/widgets/styledText_widget.dart';
import '../../../../utils/utils.dart';
import 'numbers_card.dart';

class DailyCard extends StatefulWidget {
  final dailyTests;
  final dailyCases;
  final date;
  final dailyPatients;
  final dailyCritical;
  final dailyDeaths;
  final dailyRecovered;
  final totalPatient;
  const DailyCard(
      {Key key,
      this.dailyTests,
      this.dailyCases,
      this.date,
      this.dailyPatients,
      this.dailyCritical,
      this.dailyDeaths,
      this.dailyRecovered,
      this.totalPatient})
      : super(key: key);
  @override
  _DailyCardState createState() => _DailyCardState();
}

class _DailyCardState extends State<DailyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeW(1),
      height: 250,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        gradient: LinearGradient(
          end: Alignment.bottomLeft,
          begin: Alignment.topCenter,
          colors: [Colors.pink, Colors.purple],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledText(
            text: widget.date,
            fontSize: 24,
            color: Colors.yellowAccent,
            fontFamily: 'Spartan',
          ),
          DailyNumbersCardWidget(
            titleText: 'Test Sayısı:',
            dataText: widget.dailyTests,
          ),
          DailyNumbersCardWidget(
            titleText: 'Vaka Sayısı:',
            dataText: widget.dailyPatients,
          ),
          DailyNumbersCardWidget(
            titleText: 'Toplam Vaka Sayısı:',
            dataText: widget.totalPatient,
          ),
          DailyNumbersCardWidget(
            titleText: 'İyileşen Sayısı:',
            dataText: widget.dailyRecovered,
          ),
          DailyNumbersCardWidget(
            titleText: 'Ölüm Sayısı:',
            dataText: widget.dailyDeaths,
          ),
        ],
      ),
    );
  }
}
