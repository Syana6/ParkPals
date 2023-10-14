import 'package:flutter/material.dart';
import '../to_rent_screen_theme.dart';

// 時間卡片選擇器
class SelectDateListView extends StatefulWidget {
  const SelectDateListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation, required this.getDateIndex, required this.setDateIndex})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final int Function() getDateIndex; // 從parent取得選擇的日期index
  final Function(int) setDateIndex; // 紀錄選擇的日期index給parent

  @override
  _SelectDateListState createState() => _SelectDateListState();
}

class _SelectDateListState extends State<SelectDateListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<WeekDay>? WeekDaylist;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    // 產生WeekDaylist時間卡片結構
    generateDateList();
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  // 處理按下時間卡片selected變換
  void weekDaySelected(WeekDay wd) {
    WeekDaylist?.forEach((weekday) {
      if (wd == weekday) {
        weekday.selected = true;
        widget.setDateIndex!(wd.weekIndex!);
      } else {
        weekday.selected = false;
      }
      setState(() {
      });
    });
  }

  // 產稱時間8張卡片結構放入WeekDaylist
  void generateDateList() {
    final today = DateTime.now();
    WeekDaylist = List.generate(8, (index) {
      final date = today.add(Duration(days: index));
      final weekdayInfo = mapWeekday(date);

      return WeekDay(
        dateTime: date,
        week: weekdayInfo.week,
        date: date.day,
        startColor: weekdayInfo.startColor,
        endColor: weekdayInfo.endColor,
        weekIndex : index,
        selected: widget.getDateIndex() == index, // 取得存在放parent的index
      );
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform.translate(
            offset: Offset(0.0, 30 * (1.0 - widget.mainScreenAnimation!.value)),
            child: SizedBox(
              height: 120, // 外框的高度
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: WeekDaylist?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      WeekDaylist!.length > 10 ? 10 : WeekDaylist!.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return DataView(
                    weekday: WeekDaylist![index],
                    animation: animation,
                    animationController: animationController!,
                    onDateTab: weekDaySelected,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// 時間卡片Widget
class DataView extends StatelessWidget {
  const DataView({
    Key? key,
    this.weekday,
    this.animationController,
    this.animation,
    required this.onDateTab,
  }) : super(key: key);

  final WeekDay? weekday;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Function onDateTab;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          // 淡入淡出動畫效果
          opacity: animation!,
          child: Transform.translate(
            // 水平方向的位移。animation!.value 是動畫的值，從 0.0 到 1.0。當動畫進行時，該值從 0.0 遞增到 1.0
            offset: Offset(100 * (1.0 - animation!.value), 0.0),
            child: SizedBox(
              width: 85,
              child: _buildWeekDayContainer(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeekDayContainer() {
    final bool isSelected = weekday!.selected;
    final List<Color> selectedColors = isSelected
        ? [RentScreenTheme.primaryColor, RentScreenTheme.spacer]  // 被選擇的顏色
        : [RentScreenTheme.nearlyWhite, RentScreenTheme.nearlyWhite]; // 未被選擇的顏色

    return Padding(
      padding: const EdgeInsets.only(
          // 外框的邊界間距
          top: 22,
          left: 6,
          right: 6,
          bottom: 3),
      child: InkWell(
        onTap: () {
          onDateTab(weekday); // 處理按下日期卡片的事件
          print("TODO: Click Event " + weekday!.week); // TODO:
        },
        child: Container(
          decoration: BoxDecoration(
            // 定義矩形框，裝飾（如 Container、Card 等）顏色、邊框、陰影、漸變等的外觀
            boxShadow: <BoxShadow>[
              BoxShadow(
                // 框的陰影
                color: HexColor(weekday!.endColor).withOpacity(0.6),
                offset: const Offset(1.1, 3.0),
                blurRadius: 8.0,
              ),
            ],
            gradient: LinearGradient(
              // 框的漸層背景
              colors: selectedColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              width: 1,
              style: BorderStyle.solid,
              color: HexColor(weekday!.startColor),
            ),
            // 框的圓角
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          // 內文顯示的定義
          child: Padding(
            // 控制框框跟周遭的間距
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 水平置中
              crossAxisAlignment: CrossAxisAlignment.center, // 垂直置中
              children: <Widget>[
                Text(
                  weekday!.week,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: RentScreenTheme.fontName,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: RentScreenTheme.deactivatedText,
                  ),
                ),
                // 控制上下間距
                const SizedBox(height: 8),
                Text(
                  weekday!.date.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: RentScreenTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: 0.2,
                    color: RentScreenTheme.darkText,
                  ),
                ),
                // 控制每一個物件相等大小
                const SizedBox(width: 50, height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 周轉英文簡稱 & 六日顏色(SelectDateListView用)
WeekDay mapWeekday(DateTime date) {
  final defaultColor = WeekDay(
    week: '未知',
    startColor: '#6F72CA',
    endColor: '#1E1466',
  );

  switch (date.weekday) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      return WeekDay(
        week: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'][date.weekday - 1],
        startColor: '#6F72CA',
        endColor: '#1E1466',
      );
    case 6:
    case 7:
      return WeekDay(
        week: ['Sat', 'Sun'][date.weekday - 6],
        startColor: '#FA7D82',
        endColor: '#FFB295',
      );
    default:
      return defaultColor;
  }
}

// 時間卡片
class WeekDay {
  DateTime? dateTime;
  String week;
  int date;
  String startColor;
  String endColor;
  bool selected;
  int? weekIndex;

  WeekDay({
    this.dateTime,
    this.week = '',
    this.date = 0,
    this.startColor = '',
    this.endColor = '',
    this.selected = false, 
    this.weekIndex,
  });
}
