import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/home/widget/numbers_card_widget.dart';

class TotalDeathWidget extends StatefulWidget {
  @override
  _TotalDeathWidgetState createState() => _TotalDeathWidgetState();
}

class _TotalDeathWidgetState extends State<TotalDeathWidget> {
  final ApiController apiController = Get.find();
  @override
  void initState() {
    apiController.getTotalDeaths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return CardWidget(
          text: "Toplam Ölüm",
          dataval: value,
          dataType: value.totalDeaths,
          loading: GetTotalEnum.Loading,
        );
      },
    );
  }
}
