import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/home/widget/numbers_card_widget.dart';

class TotalRecoveredWidget extends StatefulWidget {
  @override
  _TotalRecoveredWidgetState createState() => _TotalRecoveredWidgetState();
}

class _TotalRecoveredWidgetState extends State<TotalRecoveredWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return CardWidget(
          text: 'Toplam İyileşen',
          dataval: value,
          loading: GetTotalEnum.Loading,
          dataType: value.totalRecovered,
          icon: 'recovered',
        );
      },
    );
  }
}
