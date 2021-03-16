import 'package:app_usage/app_usage.dart';
import 'package:flutter/foundation.dart';

class Service {
  factory Service.instance() => _instance;

  Service._internal();

  static final _instance = Service._internal();

  void getUsageStats() async {
    Stream.periodic(Duration(seconds: 10)).listen((_) async {
      try {
        DateTime endDate = new DateTime.now();
        DateTime startDate = endDate.subtract(Duration(hours: 1));
        List<AppUsageInfo> infoList =
            await AppUsage.getAppUsage(startDate, endDate);

        for (var info in infoList) {
          print(info.toString());
        }
      } on AppUsageException catch (exception) {
        print(exception);
      }
    });
  }
}
