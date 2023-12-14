import 'package:flutter/material.dart';

import '../../enums/ParkingSpaceStatus.dart';

// 通知細項：顯示指定的車位通知訊息
class NotifyListItem {
  String? rentSpace; // 車位編號
  String message;
  String startTime; // 預計租借開始時間
  String endTime; // 預計還車時間
  String? actualendTime; // 實際還車時間
  String createTime; // 訊息記錄時間

  NotifyListItem({
    this.rentSpace,
    required this.message,
    required this.startTime,
    required this.endTime,
    required this.actualendTime,
    required this.createTime,
  });
}

class NotifyScreenDetail extends StatelessWidget {
     NotifyScreenDetail(
      {Key? key,
      required this.rentSpace,
      required this.status})
      : super(key: key);

  final String rentSpace; // 車位編號
  final ParkingSpaceStatus status; // 租借狀態

  final List<NotifyListItem> notifyList = [
    NotifyListItem(
      message: '___ 已向您以 \$10/hr 租借 B1-22號車位 成功',
      startTime: '11:00',
      endTime: '20:30',
      actualendTime: '11:18',
      createTime: '10:30 AM',
    ),
    NotifyListItem(
      message: '___ 已於17:18還車完成',
      startTime: '11:00',
      endTime: '20:30',
      actualendTime: '17:18',
      createTime: '11:45 AM',
    ),
    // NotifyListItem(
    //   avatarUrl: 'https://example.com/avatar2.png',
    //   message: '已向 ___ 以 \$15/hr 租借 B4-537號車位 成功',
    //   startTime: '00:00',
    //   endTime: '23:30',
    //   actualendTime: null,
    //   createTime: '11:45 AM',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$rentSpace - ${status == ParkingSpaceStatus.rented ? '租借中' : status == ParkingSpaceStatus.available ? '可出借' : '關閉中'}')
              
      ),
      body: ListView.builder(
        itemCount: notifyList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notifyList[index].message),
              subtitle: Text(notifyList[index].createTime),
              onTap: () {
                // 不需要處理
              },
            ),
          );
        },
      ),
    );
  }
}
