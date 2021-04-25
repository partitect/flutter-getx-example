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
    apiController.getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Example"),
      ),
      body: GetBuilder<ApiController>(builder: (value) {
        return RefreshIndicator(
            child: value.getPostEnum == GetPostEnum.Loading
                ? Center(child: Text("Loading"))
                : value.getPostEnum == GetPostEnum.Error
                    ? Text("Error")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.panorama_photosphere,
                                color: Colors.red,
                              ),
                              title: Text(value.myList[index].title),
                              subtitle: Text(
                                value.myList[index].body,
                              ),
                            ),
                          );
                        },
                      ),
            onRefresh: () async {
              value.getAllPosts();
            });
      }),
    );
  }
}
