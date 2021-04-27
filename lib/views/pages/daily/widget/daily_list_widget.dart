import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_started/controllers/api_controller.dart';
import 'package:getx_started/views/pages/daily/widget/daily_card.dart';

class DailyListWidget extends StatefulWidget {
  @override
  _DailyListWidgetState createState() => _DailyListWidgetState();
}

class _DailyListWidgetState extends State<DailyListWidget> {
  final ApiController apiController = Get.find();

  @override
  void initState() {
    apiController.getAllCovidStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (value) {
        return RefreshIndicator(
          child: value.getCovidEnum == GetCovidEnum.Loading
              ? Center(child: Text("Loading"))
              : value.getCovidEnum == GetCovidEnum.Error
                  ? Text("Error")
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DailyCard(
                                date: value.covidList[index].date,
                                dailyDeaths:
                                    value.covidList[index].deaths ?? "Ölüm Yok",
                                dailyTests: value.covidList[index].tests,
                                dailyPatients: value.covidList[index].patients,
                                dailyRecovered:
                                    value.covidList[index].recovered,
                                totalPatient:
                                    value.covidList[index].totalPatients,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: value.covidList.length,
                    ),
          onRefresh: () async {
            value.getAllCovidStats();
          },
        );
      },
    );
  }
}
