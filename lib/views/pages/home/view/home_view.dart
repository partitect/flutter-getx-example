import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/utils/moment_utils.dart';
import 'package:date_format/date_format.dart';
import 'package:getx_started/views/pages/home/widget/lineChart.dart';
import 'package:intl/intl.dart';

class HomeViewPage extends StatefulWidget {
  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  final ApiController apiController = Get.find();

  @override
  void initState() {
    apiController.getAllCovidStats();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetCovidStats Example"),
      ),
      body: Column(
        children: [
          Flexible(
            child: GetBuilder<ApiController>(
              builder: (value) {
                return RefreshIndicator(
                  child: value.getCovidEnum == GetCovidEnum.Loading
                      ? Center(child: Text("Loading"))
                      : value.getCovidEnum == GetCovidEnum.Error
                          ? Text("Error")
                          : ListView.builder(
                              itemCount: value.covidList.length,
                              itemBuilder: (context, index) {
                                print(value.covidList[index]);
                                return Card(
                                  child: ListTile(
                                    leading: Text(
                                        value.covidList[index].date.toString()),
                                    title: Text("Vaka: " +
                                        value.covidList[index].cases),
                                    subtitle: Text("Ölüm :" +
                                        value.covidList[index].deaths),
                                  ),
                                );
                              },
                            ),
                  onRefresh: () async {
                    value.getAllCovidStats();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
