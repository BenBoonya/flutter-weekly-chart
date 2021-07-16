var defaultDailyStat = DailyStatUiModel(
  day: 'day',
  stat: 0,
  isToday: false,
  isSelected: false,
  dayPosition: 1,
);

class DailyStatUiModel {
  String day;
  int stat;
  bool isToday;
  bool isSelected;
  int dayPosition;

  DailyStatUiModel(
      {required this.day,
      required this.stat,
      required this.isToday,
      required this.isSelected,
      required this.dayPosition});

  DailyStatUiModel copyWith(
          {String? day,
          int? stat,
          bool? isToday,
          bool? isSelected,
          int? dayPosition}) =>
      DailyStatUiModel(
          day: day ?? this.day,
          stat: stat ?? this.stat,
          isToday: isToday ?? this.isToday,
          isSelected: isSelected ?? this.isSelected,
          dayPosition: dayPosition ?? this.dayPosition);
}
