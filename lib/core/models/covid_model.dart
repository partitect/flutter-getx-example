// To parse this JSON data, do
//
//     final covidStats = covidStatsFromJson(jsonString);

import 'dart:convert';

Map<String, CovidStats> covidStatsFromJson(String str) =>
    Map.from(json.decode(str))
        .map((k, v) => MapEntry<String, CovidStats>(k, CovidStats.fromJson(v)));

String covidStatsToJson(Map<String, CovidStats> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class CovidStats {
  CovidStats({
    this.date,
    this.totalTests,
    this.totalPatients,
    this.totalDeaths,
    this.totalIntensiveCare,
    this.totalIntubated,
    this.totalRecovered,
    this.tests,
    this.cases,
    this.patients,
    this.critical,
    this.pneumoniaPercent,
    this.deaths,
    this.recovered,
  });

  String date;
  String totalTests;
  String totalPatients;
  String totalDeaths;
  String totalIntensiveCare;
  String totalIntubated;
  String totalRecovered;
  String tests;
  String cases;
  String patients;
  String critical;
  String pneumoniaPercent;
  String deaths;
  String recovered;

  factory CovidStats.fromJson(Map<String, dynamic> json) => CovidStats(
        date: json['date'],
        totalTests: json['totalTests'],
        totalPatients: json['totalPatients'],
        totalDeaths: json['totalDeaths'],
        totalIntensiveCare: json['totalIntensiveCare'],
        totalIntubated: json['totalIntubated'],
        totalRecovered: json['totalRecovered'],
        tests: json['tests'],
        cases: json['cases'],
        patients: json['patients'],
        critical: json['critical'],
        pneumoniaPercent: json['pneumoniaPercent'],
        deaths: json['deaths'],
        recovered: json['recovered'],
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'totalTests': totalTests,
        'totalPatients': totalPatients,
        'totalDeaths': totalDeaths,
        'totalIntensiveCare': totalIntensiveCare,
        'totalIntubated': totalIntubated,
        'totalRecovered': totalRecovered,
        'tests': tests,
        'cases': cases,
        'patients': patients,
        'critical': critical,
        'pneumoniaPercent': pneumoniaPercent,
        'deaths': deaths,
        'recovered': recovered,
      };
}
