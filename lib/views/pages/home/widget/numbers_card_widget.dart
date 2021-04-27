import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_started/widgets/styledText_widget.dart';
import '../../../../utils/utils.dart';

class CardWidget extends StatefulWidget {
  final text;
  final dataval;
  final loading;
  final dataType;
  const CardWidget(
      {Key key, this.text, this.dataval, this.loading, this.dataType})
      : super(key: key);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: context.sizeW(1),
            height: context.sizeH(.2),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topCenter,
                colors: [Colors.purple, Colors.pink],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledText(
                  text: widget.text,
                  fontSize: 40,
                  color: Colors.yellowAccent,
                  fontFamily: "Righteous",
                ),
                Center(
                  child: StyledText(
                    text: widget.dataval.getTotalEnum == widget.loading
                        ? "Yükleniyor"
                        : widget.dataType.toString(),
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/svg/corona.svg',
              height: 75.0,
              width: 75.0,
            ),
          ),
        ],
      ),
    );
  }
}
