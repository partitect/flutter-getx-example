import 'package:flutter/material.dart';
import 'package:getx_started/widgets/styledText_widget.dart';

class DailyNumbersCardWidget extends StatefulWidget {
  final dataText;
  final titleText;

  const DailyNumbersCardWidget({Key key, this.dataText, this.titleText})
      : super(key: key);
  @override
  _DailyNumbersCardWidgetState createState() => _DailyNumbersCardWidgetState();
}

class _DailyNumbersCardWidgetState extends State<DailyNumbersCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StyledText(
          text: widget.titleText,
          fontSize: 24,
          color: Colors.yellowAccent,
          fontFamily: 'Sarabun',
        ),
        StyledText(
          text: widget.dataText,
          fontSize: 24,
          color: Colors.yellowAccent,
          fontFamily: 'Sarabun',
        ),
      ],
    );
  }
}
