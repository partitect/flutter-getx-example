Future<List> getDaysInBeteween(DateTime startDate, DateTime endDate) async {
  var days = <DateTime>[];
  for (var i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}
