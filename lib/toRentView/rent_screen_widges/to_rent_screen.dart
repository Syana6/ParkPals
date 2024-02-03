import 'package:flutter/material.dart';
import 'package:parkpals/toRentView/models/responseModels/res_rent_space_info.dart';
import '../../apis/to_rent_service.dart';
import '../to_rent_screen_theme.dart';
import '../ui_view/notificate_bell.dart';
import '../ui_view/select_date_list_view.dart';
import '../ui_view/select_item_msgbox.dart';
import 'notify_screen.dart';
import 'setting_screen.dart';
import 'to_rent_info_card.dart';

// 租借：main rent_home_screen.dart
// 租借主頁面Body 使用Widge<ListView> 包裝所有功能Widget
// 搜尋功能也放在這邊傳入to_rent_detail
class ToRentScreen extends StatefulWidget {
  const ToRentScreen({Key? key, this.mainScreenAnimationController})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  @override
  _ToRentScreenState createState() => _ToRentScreenState();
}

class _ToRentScreenState extends State<ToRentScreen>
    with TickerProviderStateMixin {
  String searchValue = ''; // 搜尋車位文字區
  Animation<double>? topBarAnimation; // TopBar動畫
  List<Widget> listViews = <Widget>[]; // 所有Body UI的Widget
  final ScrollController scrollController =
      ScrollController(); // 監聽上面bar滑動的opacity
  double topBarOpacity = 0.0;
  int onSelectedDateIndex = 0; // 記錄選擇的日期index
  WeekDay? onSelectedDateObj; // 記錄選擇的日期物件
  List<resRentSpaceInfo> listSpaces = <resRentSpaceInfo>[]; // 可租借車位(by 日期)
  late Widget AppBarDateList; // 日期選擇器

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.mainScreenAnimationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    // 初始化日期選擇器
    AppBarDateList = getAppBarDateList();
    // 從API 取得指定日期車位清單
    getParkingSpaceList();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    widget.mainScreenAnimationController?.forward();
    super.initState();
  }

  // 提供Child Callback selected紀錄
  int getWeekDaySelected() {
    return onSelectedDateObj == null
        ? onSelectedDateIndex
        : onSelectedDateObj!.weekIndex;
  }

  // 提供Child Callback處理按下時間卡片selected的WeekDay物件
  void setWeekDaySelected(WeekDay wd) {
    // 點到同一個日期不處理
    if (wd.dateTime?.month == onSelectedDateObj?.dateTime?.month &&
        wd.dateTime?.day == onSelectedDateObj?.dateTime?.day) {
      return;
    }
    onSelectedDateIndex = wd.weekIndex;
    onSelectedDateObj = wd;
    print('setWeekDaySelected');
    getParkingSpaceList(); // 每次按下時間卡片 更新畫面車位清單
  }

  Widget build(BuildContext context) {
    return Container(
      color: RentScreenTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(), // 這裡是 ListView Body 的 UI
            getAppTopBarUI(), // 這裡是 AppBar 最上層固定 的 UI
            // 避免被下面狀態欄覆蓋
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  // 搜尋車位
  void searchParkingSpaces() {
    setState(() {
      // TODO: 處理weidget間的資料傳遞 模糊搜尋車位（名稱、樓層、車位編號、價格）
    });
  }

  // 從API取得指定日期(選擇到的時間index)的可租借車位清單
  Future<void> getParkingSpaceList() async {
    try {
      print('getParkingSpaceList');
      listSpaces = await getParkingSpaces(onSelectedDateObj == null
          ? DateTime.now()
          : onSelectedDateObj!.dateTime);
      addAllListData(); // 因為要等listSpaces處理完成，所以必須放在await後面
      setState(() {});
    } catch (error) {
      print('Error getParkingSpaces data: $error');
    }
  }

  // 注入所有子widget UI 進入ListViews
  void addAllListData() {
    listViews.clear();
    print('addAllListData' + listSpaces.length.toString());
    int count = listSpaces.length + 1; // 目前加入到這個頁面的UI Widget
    const int minToRentObjectCount = 10; // 可租借的UI Widget 最小10

    // 注入可租借車位列表
    for (var park in listSpaces) {
      listViews.add(
        toRentInfoCard(
            key: UniqueKey(),
            mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.mainScreenAnimationController!,
                    curve: Interval(
                        (1 / (count + 2)) * (1 + listSpaces.indexOf(park)), 1.0,
                        curve: Curves.fastOutSlowIn))),
            mainScreenAnimationController:
                widget.mainScreenAnimationController!,
            objectCount: listSpaces.length > minToRentObjectCount
                ? listSpaces.length
                : minToRentObjectCount,
            objectIndex: listSpaces.indexOf(park),
            parkingInfo: park),
      );
    }
  }

  // 設置Body中所有ListView UI物件
  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(), // 延遲顯示
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              // 從 AppBar 的下方開始顯示，避免被 AppBar 覆蓋
              top: AppBar().preferredSize.height +
                  165 +
                  MediaQuery.of(context).padding.top, // 狀態欄的高度
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return listViews[index];
            },
          );
        }
      },
    );
  }

  // 注入租借日期選擇器
  Widget getAppBarDateList() {
    return (SelectDateListView(
      key: UniqueKey(),
      mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: widget.mainScreenAnimationController!,
              curve: const Interval(0, 1, curve: Curves.fastOutSlowIn))),
      mainScreenAnimationController: widget.mainScreenAnimationController!,
      getDateIndex: getWeekDaySelected,
      setDateIndex: setWeekDaySelected,
    ));
  }

  // 設置最上層固定的Title
  Widget getAppTopBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.mainScreenAnimationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              // transform滑動時在螢幕上自由變換和定位子 Widget
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  // BoxDecoration處理topBarOpacity變化時的透明度
                  decoration: BoxDecoration(
                    color: RentScreenTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: RentScreenTheme.nearlyWhite
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      // 第一行
                      Padding(
                          // 處理topBarOpacity變化時的top與bottom
                          padding: EdgeInsets.only(
                              left: 6,
                              right: 16,
                              top: 16 - 8.0 * topBarOpacity,
                              bottom: 8 - 8.0 * topBarOpacity),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 13, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Hello _______' /* TODO:從API取得暱稱 */,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily:
                                                  RentScreenTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  18 + 6 - 1 * topBarOpacity,
                                              letterSpacing: 1.2,
                                              color: RentScreenTheme.darkerText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // 鈴鐺通知
                                  SizedBox(
                                    height: 30,
                                    width: 42,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(36.0)),
                                      onTap: () {
                                        // 切換到通知畫面
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NotifyScreen()),
                                        );
                                      },
                                      child: NotificateBell(),
                                    ),
                                  ),
                                  // 設定
                                  SizedBox(
                                    height: 30,
                                    width: 42,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(36.0)),
                                      onTap: () {
                                        // 切換到設定畫面
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingScreen()),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.settings,
                                        color:
                                            Color.fromARGB(255, 32, 118, 175),
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      // 第二行
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22, right: 16, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // 選擇社區icon
                            SelectItemMsgBox(),
                            // SizedBox(
                            //   height: 58,
                            //   width: 55,
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: InkWell(
                            //       highlightColor: Colors.transparent,
                            //       borderRadius: const BorderRadius.all(
                            //           Radius.circular(32.0)),
                            //       onTap: () {},
                            //       child: Icon(Icons.sort,
                            //           size: 42 - 6 * topBarOpacity,
                            //           color: RentScreenTheme.primaryColor),
                            //     ),
                            //   ),
                            // ),
                            // 搜尋車位
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 18 - 1 * topBarOpacity), // 调整文本大小
                                decoration: const InputDecoration(
                                    hintText: '搜尋車位',
                                    border: UnderlineInputBorder(),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        5, 8, 0, 0) // 调整文本位置
                                    ),
                                onChanged: (value) {
                                  searchValue = value;
                                  searchParkingSpaces();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        // 處理topBarOpacity變化時的top與bottom
                        padding: EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 16 - 8.0 * topBarOpacity),
                        child: AppBarDateList,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  // Delay Time
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }
}
