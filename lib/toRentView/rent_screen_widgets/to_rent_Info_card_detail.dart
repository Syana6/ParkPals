// 租借：欲租借車位詳細資訊頁面
// 可挑選要租借的時間
// 自動計算總價
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/responseModels/res_rent_space_info.dart';

class toRentInfoCardDetail extends StatefulWidget {
  final resRentSpaceInfo parkingSpace;
  const toRentInfoCardDetail({Key? key, required this.parkingSpace})
      : super(key: key);

  @override
  _toRentInfoCardDetailState createState() => _toRentInfoCardDetailState();
}

class _toRentInfoCardDetailState extends State<toRentInfoCardDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.parkingSpace.communityName} ${widget.parkingSpace.owner} ${widget.parkingSpace.floor} ${widget.parkingSpace.space}',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 顯示車位詳細資訊
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.file(
              File(widget.parkingSpace.image),
              fit: BoxFit.cover,
              height: 200.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // 顯示車位樓層和號碼
          Card(
            child: ListTile(
              title: Text('樓層: ${widget.parkingSpace.floor}'),
              subtitle: Text('車位號碼: ${widget.parkingSpace.space}'),
            ),
          ),

          // 顯示可租借時間起迄
          Card(
            child: ListTile(
              title: const Text('可租借時間'),
              subtitle: Text(
                '起始時間: ${widget.parkingSpace.idleStrTime} ~ 結束時間: ${widget.parkingSpace.idleEndTime}',
              ),
            ),
          ),

          // 顯示單價與總費用
          Card(
            // TODO: 需要再增加選擇時間的邏輯並重新計算
            child: ListTile(
              title: Text('單價: ${widget.parkingSpace.price.toString()} / hr'),
              subtitle: Text('總費用: ${calculateTotalPrice()}'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // 處理確定租借按鈕的點擊事件
              // TODO: 在此處執行確定租借的相應邏輯
            },
            child: const Text('確定租借'),
          ),
        ),
      ),
    );
  }

  // 計算總價
  double calculateTotalPrice() {
    // 計算時間區間
    DateTime idleStartTime = DateTime.parse(
        '${widget.parkingSpace.idleDate!} ${widget.parkingSpace.idleStrTime!}');
    DateTime idleEndTime = DateTime.parse(
        '${widget.parkingSpace.idleDate!} ${widget.parkingSpace.idleEndTime!}');
    Duration timeDifference = idleEndTime.difference(idleStartTime);

    // 計算總費用
    double pricePerHour = double.parse(widget.parkingSpace.price);
    double totalHours = timeDifference.inHours.toDouble();

    // 不滿1小時以1小時計算
    if (timeDifference.inMinutes.remainder(60) > 0) {
      totalHours += 1; // Round up the total hours if there is any fraction
    }

    double totalPrice = pricePerHour * totalHours;

    return totalPrice;
  }
}
