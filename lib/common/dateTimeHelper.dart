// 計算時間差算出出租小時數，不足30分鐘按0.5計算，超過30分鐘小於60分鐘按1計算
double calculateHourDifference(String startTime, String endTime) {
  try {
    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);
    Duration difference = end.difference(start);

    double minutes = difference.inMinutes.toDouble();
    double hourDifference = 0.0;

    if (minutes <= 30) {
      hourDifference = 0.5;
    } else if (minutes > 30 && minutes <= 60) {
      hourDifference = 1.0;
    } else {
      hourDifference = minutes / 60.0;
    }

    return double.parse(hourDifference.toStringAsFixed(1));
  } catch (e) {
    print('解析日期時間字符串時出錯：$e');
    return 0.0;
  }
}

// 將傳入的時間的minutes可以整除於30,並且時間要大於現在
DateTime getNextValidTime(DateTime targetTime) {
  try {
    DateTime currentTime = DateTime.now();
    DateTime nextValidTime = DateTime(
      targetTime.year,
      targetTime.month,
      targetTime.day,
      targetTime.hour,
      (targetTime.minute + (30 - targetTime.minute % 30)) % 60,
    );

    if (nextValidTime.isBefore(currentTime)) {
      nextValidTime = nextValidTime.add(const Duration(minutes: 30));
    }
    return nextValidTime;
  } catch (e) {
    print('getNextValidTime error：$e');
    return targetTime;
  }
}
