import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkpals/rentView/rent_home_screen.dart';
import 'app_theme.dart';
import 'forRentView/parkingCommunity.dart';

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
      systemNavigationBarDividerColor: Colors.transparent, // 設置導航欄分隔線的顏色為透明，即不顯示分隔線
      systemNavigationBarIconBrightness: Brightness.dark, // 設置導航欄上的圖標（如返回按鈕、最近按鈕等）的顏色為深色
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

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // 預設
  final PageController _pageController =
      PageController(initialPage: 1); // match with initial index

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    // update index and rebuild widgets
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          controller: _pageController,
          children: const [
            parkingCommunity(),
            RentHomeScreen(),
            // TODO: Add your 3rd page here
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
