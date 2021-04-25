import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_started/controllers/api_controller.dart';

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
      body: GetBuilder<ApiController>(builder: (value) {
        return RefreshIndicator(
            child: value.getCovidEnum == GetCovidEnum.Loading
                ? Center(child: Text("Loading"))
                : value.getCovidEnum == GetCovidEnum.Error
                    ? Text("Error")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.panorama_photosphere,
                                color: Colors.red,
                              ),
                              title: Text("value.covidList[index].tests"),
                              subtitle: Text(" value.covidList[index].tests,"),
                            ),
                          );
                        },
                      ),
            onRefresh: () async {
              value.getAllCovidStats();
            });
      }),
    );
  }
}
