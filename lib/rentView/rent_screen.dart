import 'package:flutter/material.dart';
import 'package:parkpals/rentView/rent_screen_widges/can_rent_list.dart';

import '../models/fakeData.dart';
import '../models/parkingSpace.dart';

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
    List<ParkingSpace> filteredParkingSpaces = []; // 快速模糊搜尋搜尋後的車位

    @override
    void initState() {
      super.initState();
    }

    // 搜尋車位
    void searchParkingSpaces() {
      setState(() {
        // TODO:預設初始值撈取DB資料 使用CanRent
        filteredParkingSpaces = fakeParkingSpaces
            .where((space) => '${space.owner} ${space.floor} ${space.space}'
            .contains(searchValue))
            .toList();
      });
    }

    Widget build (BuildContext context) {
      return CanRentList(
        
      );
    }
  }