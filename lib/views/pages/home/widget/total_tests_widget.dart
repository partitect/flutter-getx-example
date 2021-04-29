import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/home/widget/numbers_card_widget.dart';

class TotalTestsWidget extends StatefulWidget {
  @override
  _TotalTestsWidgetState createState() => _TotalTestsWidgetState();
}

class _TotalTestsWidgetState extends State<TotalTestsWidget> {
  final ApiController apiController = Get.find();
  @override
  void initState() {
    apiController.getTotalTests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return CardWidget(
            text: "Toplam Test",
            dataval: value,
            loading: GetTotalEnum.Loading,
            dataType: value.totalTests,
            icon: "test");
      },
    );
  }
}
