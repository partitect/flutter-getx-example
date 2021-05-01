import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/home/widget/numbers_card_widget.dart';

class ActiveCaseWidget extends StatefulWidget {
  @override
  _ActiveCaseWidgetState createState() => _ActiveCaseWidgetState();
}

class _ActiveCaseWidgetState extends State<ActiveCaseWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return CardWidget(
            text: 'Aktif Vaka',
            dataval: value,
            loading: GetTotalEnum.Loading,
            dataType: value.totalActiveCase,
            icon: 'corona');
      },
    );
  }
}
