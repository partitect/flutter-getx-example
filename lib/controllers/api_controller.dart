import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_started/core/models/covid_model.dart';
import 'package:getx_started/core/models/posts_model.dart';
import 'package:getx_started/core/services/api_services.dart';
import 'package:getx_started/utils/moment_utils.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

enum GetPostEnum { Loaded, Loading, Error, Initial }
enum GetCovidEnum { Loaded, Loading, Error, Initial }

class ApiController extends GetxController {
  ApiServices _apiServices = ApiServices();
  GetPostEnum getPostEnum = GetPostEnum.Initial;
  GetCovidEnum getCovidEnum = GetCovidEnum.Initial;

  List<CovidStats> covidList = [];
  List<PostsModel> myList = [];

  Future getAllCovidStats() {
    getCovidEnum = GetCovidEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('03/01/2021');
        var date2 = DateFormat.yMd().parse('04/25/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format("dd/MM/yyyy")];
            List<dynamic> list = [];
            list.add(data);
            for (var stat in list) {
              covidList.add(CovidStats.fromJson(stat));
            }
          }
        });

        getCovidEnum = GetCovidEnum.Loaded;
        update();
      } else {
        getCovidEnum = GetCovidEnum.Error;
        update();
      }
    });
  }

  Future getAllPosts() {
    getPostEnum = GetPostEnum.Loading;
    myList.clear();
    update();

    _apiServices.getAllPosts().then((value) {
      if (value != false) {
        for (var post in value) {
          myList.add(PostsModel.fromJson(post));
        }
        getPostEnum = GetPostEnum.Loaded;
        update();
      } else {
        print('Postlar Çekilirken Bir Sorun Oluştu...');
        getPostEnum = GetPostEnum.Error;
        update();
      }
    });
  }
}
