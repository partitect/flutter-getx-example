import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  var BASEURL = "https://jsonplaceholder.typicode.com/posts";
  var CovidURL =
      "https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json";
  Future getAllPosts() async {
    var url = Uri.parse(BASEURL);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future getCovidStats() async {
    var url = Uri.parse(CovidURL);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map =
          Map<String, dynamic>.from(json.decode(response.body));
      return map;
    } else {
      print("Covid Verileri Çekilirken Hata Oluştu");
      return false;
    }
  }
}
