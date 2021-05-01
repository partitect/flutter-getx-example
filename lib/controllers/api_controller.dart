import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_started/core/models/covid_model.dart';
import 'package:getx_started/core/models/posts_model.dart';
import 'package:getx_started/core/services/api_services.dart';
import 'package:getx_started/utils/moment_utils.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

enum GetPostEnum { Loaded, Loading, Error, Initial }
enum GetCovidEnum { Loaded, Loading, Error, Initial }
enum GetTotalEnum { Loaded, Loading, Error, Initial }

class ApiController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  GetPostEnum getPostEnum = GetPostEnum.Initial;
  GetCovidEnum getCovidEnum = GetCovidEnum.Initial;
  GetTotalEnum getTotalEnum = GetTotalEnum.Initial;

  List<CovidStats> covidList = [];
  List<PostsModel> myList = [];
  var totalPatients;
  var totalDeaths;
  var totalTests;
  var totalRecovered;
  var totalActiveCase;
  // ignore: missing_return
  Future getAllCovidStats() {
    getCovidEnum = GetCovidEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('03/11/2020');
        var date2 = DateFormat.yMd().parse('04/25/2021');
        //üstte iki tarih arası verileri getirmesi için tarihleri verdim, altta da iki tarihin arasındaki tüm tarihleri getiren getDaysinBetween fonksiyonu ile o tarihler arasında apiyi döndürdüm
        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            //allta apinin başlarında tarih olması sebebiyle dynamic list oluşturdum, senin hata aldığın yer burası

            var list = <dynamic>[];
            list.add(data);
            //add ile tarihli object leri listeme ekledim

            for (var stat in list) {
              //listemin içinde bir daha döndüm ve modelime ekledim
              //
              covidList.add(CovidStats.fromJson(stat));
            }
            covidList.sort((a, b) {
              var adate = a.date;
              var bdate = b.date;
              return adate.compareTo(bdate);
            });
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

  // ignore: missing_return
  Future getTotalPatients() {
    getTotalEnum = GetTotalEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('04/26/2021');
        var date2 = DateFormat.yMd().parse('04/26/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            var list = <dynamic>[];
            list.add(data);
            for (var stat in list) {
              if (CovidStats.fromJson(stat).cases != null) {
                totalPatients = CovidStats.fromJson(stat).totalPatients;
              }
            }
          }
        });
        getTotalEnum = GetTotalEnum.Loaded;
        update();
      } else {
        getTotalEnum = GetTotalEnum.Error;
        update();
      }
    });
  }

  // ignore: missing_return
  Future getTotalDeaths() {
    getTotalEnum = GetTotalEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('04/26/2021');
        var date2 = DateFormat.yMd().parse('04/26/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            var list = <dynamic>[];
            list.add(data);
            for (var stat in list) {
              if (CovidStats.fromJson(stat).cases != null) {
                totalDeaths = CovidStats.fromJson(stat).totalDeaths;
              }
            }
          }
        });
        getTotalEnum = GetTotalEnum.Loaded;
        update();
      } else {
        getTotalEnum = GetTotalEnum.Error;
        update();
      }
    });
  }

  // ignore: missing_return
  Future getTotalTests() {
    getTotalEnum = GetTotalEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('04/26/2021');
        var date2 = DateFormat.yMd().parse('04/26/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            var list = <dynamic>[];
            list.add(data);
            for (var stat in list) {
              if (CovidStats.fromJson(stat).cases != null) {
                totalTests = CovidStats.fromJson(stat).totalTests;
              }
            }
          }
        });
        getTotalEnum = GetTotalEnum.Loaded;
        update();
      } else {
        getTotalEnum = GetTotalEnum.Error;
        update();
      }
    });
  }

  // ignore: missing_return
  Future getTotalRecovered() {
    getTotalEnum = GetTotalEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('04/26/2021');
        var date2 = DateFormat.yMd().parse('04/26/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            var list = <dynamic>[];
            list.add(data);
            for (var stat in list) {
              if (CovidStats.fromJson(stat).cases != null) {
                totalRecovered = CovidStats.fromJson(stat).totalRecovered;
              }
            }
          }
        });
        getTotalEnum = GetTotalEnum.Loaded;
        update();
      } else {
        getTotalEnum = GetTotalEnum.Error;
        update();
      }
    });
  }

  // ignore: missing_return
  Future getActiveCase() {
    getTotalEnum = GetTotalEnum.Loading;
    covidList.clear();
    update();
    _apiServices.getCovidStats().then((value) {
      if (value != false) {
        var date1 = DateFormat.yMd().parse('04/26/2021');
        var date2 = DateFormat.yMd().parse('04/26/2021');

        getDaysInBeteween(date1, date2).then((dateVal) {
          for (var dts in dateVal) {
            var data = value[Jiffy(dts).format('dd/MM/yyyy')];
            var list = <dynamic>[];
            list.add(data);
            for (var stat in list) {
              if (CovidStats.fromJson(stat).cases != null) {
                totalActiveCase =
                    int.parse(CovidStats.fromJson(stat).totalPatients) -
                        int.parse(CovidStats.fromJson(stat).totalRecovered);
              }
            }
          }
        });
        getTotalEnum = GetTotalEnum.Loaded;
        update();
      } else {
        getTotalEnum = GetTotalEnum.Error;
        update();
      }
    });
  }

  // ignore: missing_return
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
