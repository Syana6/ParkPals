import 'package:flutter/material.dart';
import 'package:parkpals/rentView/rent_screen_widges/can_rent_list.dart';

// main rent_home_screen.dart
// 租借主頁面Body 使用Widge<ListView> 包裝所有功能Widget
// 搜尋功能也放在這邊傳入CanRent
class RentScreen extends StatefulWidget {
  const RentScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _RentScreenState createState() => _RentScreenState();
}

  class _RentScreenState extends State<RentScreen> with TickerProviderStateMixin {
    String searchValue = '';

    // 所有Body UI的Widget
    List<Widget> listViews = <Widget>[]; 

    @override
    void initState() {
      super.initState();
    }

    Widget build (BuildContext context) {
      return CanRentList(
        
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
      const int count = 3;
    }
  }