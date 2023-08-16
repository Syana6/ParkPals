import 'package:flutter/material.dart';
import '../rent_screen_theme.dart';
import '../ui_view/select_date_list_view.dart';
import '../ui_view/select_item_msgbox.dart';

// main rent_home_screen.dart
// 租借主頁面Body 使用Widge<ListView> 包裝所有功能Widget
// 搜尋功能也放在這邊傳入CanRent
class RentScreen extends StatefulWidget {
  const RentScreen({Key? key, this.mainScreenAnimationController})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  @override
  _RentScreenState createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> with TickerProviderStateMixin {
  String searchValue = ''; // 搜尋車位用
  Animation<double>? topBarAnimation; // TopBar動畫
  List<Widget> listViews = <Widget>[]; // 所有Body UI的Widget
  final ScrollController scrollController =
      ScrollController(); // 監聽上面bar滑動的opacity
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.mainScreenAnimationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

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
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: RentScreenTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(), // 這裡是 ListView Body 的 UI
            getAppBarUI(), // 這裡是 AppBar 最上層固定 的 UI
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

  // ListView UI 注入
  void addAllListData() {
    const int count = 5; // 目前加入到這個頁面的UI Widget

    // 時間選擇器
    listViews.add(
      SelectDateListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.mainScreenAnimationController!,
                curve: const Interval((1 / (count)) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.mainScreenAnimationController!,
      ),
    );
  }

  // ListView Body 的 UI
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
                  45 +
                  MediaQuery.of(context).padding.top, // 狀態欄的高度
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.mainScreenAnimationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  // 最上層固定的Title
  Widget getAppBarUI() {
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
                          color: RentScreenTheme.grey
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
                                          20, 0, 18, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '我想借車位',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily:
                                                  RentScreenTheme.fontName,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  22 + 6 - 6 * topBarOpacity,
                                              letterSpacing: 1.2,
                                              color: RentScreenTheme.darkerText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // 左邊箭頭
                                  SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(32.0)),
                                      onTap: () {},
                                      child: const Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: RentScreenTheme.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 15 May
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 8,
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Icon(
                                            Icons.calendar_today,
                                            color: RentScreenTheme.grey,
                                            size: 18,
                                          ),
                                        ),
                                        Text(
                                          '15 May',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily:
                                                RentScreenTheme.fontName,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            letterSpacing: -0.2,
                                            color: RentScreenTheme.darkerText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 右邊箭頭
                                  SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(32.0)),
                                      onTap: () {},
                                      child: const Center(
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: RentScreenTheme.grey,
                                        ),
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
                            left: 22, right: 16, bottom: 10),
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
                                style: const TextStyle(fontSize: 18), // 调整文本大小
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
                      )
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