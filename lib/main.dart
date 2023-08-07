import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkpals/rentView/rent_home_screen.dart';
import 'app_theme.dart';
import 'forRentView/parkingCommunity.dart';
import 'rentView/ui_view/drop_down_button.dart';

void main() {
  runApp(const ParkPALsApp());
}

class ParkPALsApp extends StatelessWidget {
  const ParkPALsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 設定狀態欄的背景顏色為透明
      statusBarIconBrightness: Brightness.dark, // 設置狀態欄上的圖標（如時間、電池狀態等）的顏色為深色
      statusBarBrightness: // 設置狀態欄的亮度
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white, // 設置導航欄的背景顏色為白色
      systemNavigationBarDividerColor:
          Colors.transparent, // 設置導航欄分隔線的顏色為透明，即不顯示分隔線
      systemNavigationBarIconBrightness:
          Brightness.dark, // 設置導航欄上的圖標（如返回按鈕、最近按鈕等）的顏色為深色
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      title: '社區車位租借',
      // TODO: 這裡要加入登入頁面
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 1; // 預設
  AnimationController? _animationController;
  final PageController _pageController =
      PageController(initialPage: 1); // match with initial index

  Widget tabBody = Container(color: const Color(0xFFF2F3F8));

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    // 初始化租借畫面
    tabBody =
        RentHomeScreen(mainScreenAnimationController: _animationController);

    super.initState();
  }

  // 最下方的navigationBar上的按鈕
  void _onItemTapped(int index) {
    if (_currentIndex == index) {
      return;
    }
    _animationController?.reverse().then<dynamic>((data) {
      // 切換頁面後動畫倒轉，改變index
      setState(() => _currentIndex = index);
    });
    
    if (index == 0) {
      tabBody = parkingCommunity();
    }
    else if (index == 1) {
      tabBody =
          RentHomeScreen(mainScreenAnimationController: _animationController);
    } 
    else if (index == 2) {
      // tabBody =
      //     DropDownButton(mainScreenAnimationController: _animationController);
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      // 確保內容不會受到設備的尺寸限制（如時間、電池狀態或返回按鈕、應用程式標題等）
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  
                  alignment: AlignmentDirectional.bottomCenter, // 新增這一行
                  children: <Widget>[
                    tabBody,
                    navigationBar(),
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  // 下方導航列
  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_upward),
          label: '出借',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_downward),
          label: '租借',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '帳號',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
