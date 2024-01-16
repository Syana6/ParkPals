// 租借：車位詳細資訊頁面
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/responseModels/res_rent_space_info.dart';
import 'package:flutter/material.dart';

class toRentDetail extends StatefulWidget {
  final resRentSpaceInfo parkingSpace;

  const toRentDetail({Key? key, required this.parkingSpace}) : super(key: key);

  @override
  _toRentDetailState createState() => _toRentDetailState();
}

class _toRentDetailState extends State<toRentDetail> {
  // 選擇的時間
  String selectedStartHour = '00';
  String selectedStartMinute = '00';

  String selectedEndHour = '00';
  String selectedEndMinute = '00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.parkingSpace.communityName} ${widget.parkingSpace.owner} ${widget.parkingSpace.floor} ${widget.parkingSpace.space}',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // 顯示車位詳細資訊
          Container(
            padding: EdgeInsets.all(16.0),
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

          // 卡片顯示車位樓層和號碼
          Card(
            child: ListTile(
              title: Text('樓層: ${widget.parkingSpace.floor}'),
              subtitle: Text('車位號碼: ${widget.parkingSpace.space}'),
            ),
          ),

          // 卡片顯示可租借時間起迄
          Card(
            child: ListTile(
              title: Text('可租借時間'),
              subtitle: Text(
                '起始時間: ${widget.parkingSpace.idleStrTime} ~ 結束時間: ${widget.parkingSpace.idleEndTime}',
              ),
            ),
          ),

          // 租借時間選擇
          Card(
            child: ListTile(
              title: Text('選擇租借時間'),
              subtitle: Row(
                children: [
                  // 選擇起始小時
                  Container(
                    margin: EdgeInsets.fromLTRB(8,8,15,8), // 設定外邊距
                    child: DropdownButton<String>(
                      value: selectedStartHour,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStartHour = newValue!;
                        });
                      },
                      items: List.generate(24, (index) {
                        String hour = index.toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: hour,
                          child: Text(hour),
                        );
                      }),
                    ),
                  ),
                  Text(':'),
                  // 選擇起始分鐘
                  Container(
                    margin: EdgeInsets.fromLTRB(8,8,15,8), // 設定外邊距
                    child: DropdownButton<String>(
                      value: selectedStartMinute,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStartMinute = newValue!;
                        });
                      },
                      items: List.generate(2, (index) {
                        String minute = (index * 30).toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: minute,
                          child: Text(minute),
                        );
                      }),
                    ),
                  ),
                  Text(' ~ '), // 分隔起始和結束時間
                  // 選擇結束小時
                  Container(
                    margin: EdgeInsets.fromLTRB(15,8,15,8), // 設定外邊距
                    child: DropdownButton<String>(
                      value: selectedEndHour,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEndHour = newValue!;
                        });
                      },
                      items: List.generate(24, (index) {
                        String hour = index.toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: hour,
                          child: Text(hour),
                        );
                      }),
                    ),
                  ),
                  Text(':'),
                  // 選擇結束分鐘
                  Container(
                    margin: EdgeInsets.fromLTRB(8,8,15,8), // 設定外邊距
                    child: DropdownButton<String>(
                      value: selectedEndMinute,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEndMinute = newValue!;
                        });
                      },
                      items: List.generate(2, (index) {
                        String minute = (index * 30).toString().padLeft(2, '0');
                        return DropdownMenuItem<String>(
                          value: minute,
                          child: Text(minute),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            child: Text('確定租借'),
          ),
        ),
      ),
    );
  }
}
