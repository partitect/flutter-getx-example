import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/home/widget/numbers_card_widget.dart';

class TotalPatientsWidget extends StatefulWidget {
  @override
  _TotalPatientsWidgetState createState() => _TotalPatientsWidgetState();
}

class _TotalPatientsWidgetState extends State<TotalPatientsWidget> {
  final ApiController apiController = Get.find();
  @override
  void initState() {
    apiController.getTotalPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return CardWidget(
          text: "Toplam Vaka",
          dataval: value,
          loading: GetTotalEnum.Loading,
          dataType: value.totalPatients,
        );
      },
    );
  }
}
