import 'package:flutter/material.dart';
import '../rent_screen_theme.dart';

// 時間卡片選擇器
class SelectDateListView extends StatefulWidget {
  const SelectDateListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

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

    // 產生時間卡片內容
    getDateList();
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  // 時間卡片內容
  void getDateList() {
    WeekDaylist = <WeekDay>[
      WeekDay(
        dateTime: DateTime.now(),
        week: mapWeekday(DateTime.now()),
        date: DateTime.now().day,
        startColor: '#FA7D82',
        endColor: '#FFB295',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 1)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 1))),
        date: DateTime.now().add(const Duration(days: 1)).day,
        startColor: '#738AE6',
        endColor: '#5C5EDD',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 2)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 2))),
        date: DateTime.now().add(const Duration(days: 2)).day,
        startColor: '#FE95B6',
        endColor: '#FF5287',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 3)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 3))),
        date: DateTime.now().add(const Duration(days: 3)).day,
        startColor: '#6F72CA',
        endColor: '#1E1466',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 4)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 4))),
        date: DateTime.now().add(const Duration(days: 4)).day,
        startColor: '#6F72CA',
        endColor: '#1E1466',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 5)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 5))),
        date: DateTime.now().add(const Duration(days: 5)).day,
        startColor: '#6F72CA',
        endColor: '#1E1466',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 6)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 6))),
        date: DateTime.now().add(const Duration(days: 6)).day,
        startColor: '#6F72CA',
        endColor: '#1E1466',
      ),
      WeekDay(
        dateTime: DateTime.now().add(const Duration(days: 31)),
        week: mapWeekday(DateTime.now().add(const Duration(days: 31))),
        date: DateTime.now().add(const Duration(days: 31)).day,
        startColor: '#6F72CA',
        endColor: '#1E1466',
      ),
    ];
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
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
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

class DataView extends StatelessWidget {
  const DataView(
      {Key? key, this.weekday, this.animationController, this.animation})
      : super(key: key);

  final WeekDay? weekday;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          // 淡入淡出動畫效果
          opacity: animation!,
          child: Transform(
            // 水平方向的位移。animation!.value 是動畫的值，從 0.0 到 1.0。當動畫進行時，該值從 0.0 遞增到 1.0
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: 85,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        // 外框的邊界間距
                        top: 22,
                        left: 6,
                        right: 6,
                        bottom: 3),
                    child: InkWell(
                      onTap: () {
                        print("TODO: Click Event " + weekday!.week); // TODO:
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // 定義矩形框，裝飾（如 Container、Card 等）顏色、邊框、陰影、漸變等的外觀
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                // 框的陰影
                                color: HexColor(weekday!.endColor)
                                    .withOpacity(0.6),
                                offset: const Offset(1.1, 3.0),
                                blurRadius: 8.0),
                          ],
                          gradient: LinearGradient(
                            // 框的漸變背景
                            colors: <HexColor>[
                              HexColor(weekday!.startColor),
                              HexColor(weekday!.endColor),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            // 框的圓角
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        // 內文顯示的定義
                        child: Padding(
                          // 控制框框跟周遭的間距
                          padding: const EdgeInsets.only(
                              top: 13, left: 13, right: 13, bottom: 13),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // 水平置中
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // 垂直置中
                            children: <Widget>[
                              Text(
                                weekday!.week,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: RentScreenTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  color: RentScreenTheme.white,
                                ),
                              ),
                              // 控制上下間距
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                weekday!.date.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: RentScreenTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  letterSpacing: 0.2,
                                  color: RentScreenTheme.white,
                                ),
                              ),
                              // 控制每一個物件相等大小
                              const SizedBox(
                                width: 50,
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// 周轉英文簡稱(SelectDateListView用)
String mapWeekday(DateTime date) {
  switch (date.weekday) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Mon';
    case 7:
      return 'Mon';
    default:
      return '未知';
  }
}

// 時間卡片
class WeekDay {
  DateTime? dateTime;
  String week;
  int date;
  String startColor;
  String endColor;

  WeekDay({
    this.dateTime,
    this.week = '',
    this.date = 0,
    this.startColor = '',
    this.endColor = '',
  });
}
