import 'dart:math';

import 'package:get/get.dart';
import 'package:weeklygraph/util/date_util.dart';

import 'data/daily_stat_ui_model.dart';

class StatController extends GetxController {
  RxString todayStat = "".obs;
  RxString currentWeek = "".obs;

  RxList<DailyStatUiModel> dailyStatList1 = (List<DailyStatUiModel>.of([])).obs;
  RxList<DailyStatUiModel> dailyStatList2 = (List<DailyStatUiModel>.of([])).obs;
  RxList<DailyStatUiModel> dailyStatList3 = (List<DailyStatUiModel>.of([])).obs;

  RxBool displayNextWeekBtn = false.obs;

  //mock stat data is set to positive number, so the max value is initialize as negative
  int maxSection1 = -1;
  int maxSection2 = -1;
  int maxSection3 = -1;

  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  @override
  void onInit() {
    setCurrentWeek();
    super.onInit();
  }

  void resetMaxValue() {
    maxSection1 = -1;
    maxSection2 = -1;
    maxSection3 = -1;
  }

  void setCurrentWeek() async {
    selectedDate = DateTime.now();
    currentWeek.value = getWeekDisplayDate(selectedDate);
    getDailyStatList(selectedDate);
  }

  void setPreviousWeek() {
    selectedDate = selectedDate.subtract(Duration(days: 7));
    setNextWeekButtonVisibility();
    currentWeek.value = getWeekDisplayDate(selectedDate);
    getDailyStatList(selectedDate);
  }

  void setNextWeek() {
    selectedDate = selectedDate.add(Duration(days: 7));
    setNextWeekButtonVisibility();
    currentWeek.value = getWeekDisplayDate(selectedDate);
    getDailyStatList(selectedDate);
  }

  void setNextWeekButtonVisibility() {
    displayNextWeekBtn.value = !selectedDate.isSameDate(currentDate);
  }

  String getWeekDisplayDate(DateTime dateTime) {
    return '${AppDateUtils.firstDateOfWeek(dateTime).toFormatString('dd MMM')} - ${AppDateUtils.lastDateOfWeek(dateTime).toFormatString('dd MMM')}';
  }

  Future<void> getDailyStatList(DateTime dateTime) async {
    resetMaxValue();
    var daysInWeek = AppDateUtils.getDaysInWeek(dateTime);

    List<DailyStatUiModel> section1Stat = List.filled(7, defaultDailyStat);
    List<DailyStatUiModel> section2Stat = List.filled(7, defaultDailyStat);
    List<DailyStatUiModel> section3Stat = List.filled(7, defaultDailyStat);

    var today = DateTime.now();
    var todayPosition = DateTime.now().weekday - 1;

    for (var i = 0; i <= 6; i++) {
      var date = daysInWeek[i];
      var randomStat1 = randomInt(100);
      section1Stat[i] = DailyStatUiModel(
          day: date.toFormatString('EEE'),
          stat: randomStat1,
          isToday: today.isSameDate(date),
          isSelected: todayPosition == i,
          dayPosition: i);

      if (maxSection1 < randomStat1) {
        maxSection1 = randomStat1;
      }

      var randomStat2 = randomInt(100);
      section2Stat[i] = DailyStatUiModel(
          day: date.toFormatString('EEE'),
          stat: randomStat2,
          isToday: today.isSameDate(date),
          isSelected: todayPosition == i,
          dayPosition: i);

      if (maxSection2 < randomStat1) {
        maxSection2 = randomStat2;
      }

      var randomStat3 = randomInt(100);
      section3Stat[i] = DailyStatUiModel(
          day: date.toFormatString('EEE'),
          stat: randomStat3,
          isToday: today.isSameDate(date),
          isSelected: todayPosition == i,
          dayPosition: i);

      if (maxSection3 < randomStat1) {
        maxSection3 = randomStat3;
      }

      dailyStatList1.assignAll(section1Stat);
      dailyStatList2.assignAll(section2Stat);
      dailyStatList3.assignAll(section3Stat);
    }
  }

  int randomInt(int max) {
    return Random().nextInt(100) + 1;
  }

  void setSelectedDayPosition(int position, int sectionNumber) {
    switch (sectionNumber) {
      case 1:
        {
          dailyStatList1.assignAll(getDailyListWithSelectedDay(
            dailyStatList1.call(),
            position,
          ));
          break;
        }
      case 2:
        {
          dailyStatList2.assignAll(getDailyListWithSelectedDay(
            dailyStatList2.call(),
            position,
          ));
          break;
        }
      case 3:
        {
          dailyStatList3.assignAll(getDailyListWithSelectedDay(
            dailyStatList3.call(),
            position,
          ));
          break;
        }
    }
  }

  List<DailyStatUiModel> getDailyListWithSelectedDay(
      List<DailyStatUiModel> list, int position) {
    return list
        .map((e) => e.copyWith(isSelected: e.dayPosition == position))
        .toList();
  }

  double getStatPercentage(int time, int type) {
    switch (type) {
      case 1:
        {
          return getSection1StatPercentage(time);
        }
      case 2:
        {
          return getSection2StatPercentage(time);
        }
      case 3:
        {
          return getSection3StatPercentage(time);
        }
      default:
        return 0.0;
    }
  }

  double getSection3StatPercentage(int time) {
    if (time == 0) {
      return 0;
    } else {
      return time / maxSection3;
    }
  }

  double getSection2StatPercentage(int time) {
    if (time == 0) {
      return 0;
    } else {
      return time / maxSection2;
    }
  }

  double getSection1StatPercentage(int time) {
    if (time == 0) {
      return 0;
    } else {
      return time / maxSection1;
    }
  }

  void onNextWeek() {
    setNextWeek();
  }

  void onPreviousWeek() {
    setPreviousWeek();
  }
}
