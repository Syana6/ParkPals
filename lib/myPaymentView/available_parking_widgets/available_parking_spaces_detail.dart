import 'package:flutter/material.dart';
import '../../common/dateTimeHelper.dart';
import 'available_parking_spaces_edit.dart';

// 上架中車位資訊
class AvailableParkingSpacesDetail extends StatelessWidget {
  final String community; // 社區
  final String spaces; // 車位
  const AvailableParkingSpacesDetail(
      {Key? key, required this.community, required this.spaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$community  $spaces 出借資訊',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: Container(
            // 設定寬度上限
            constraints: const BoxConstraints(maxWidth: 450),
            child: ListView.builder(
              itemCount: _vacants.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _vacants[index];
                return Card(
                  elevation: 20,
                  child: ListTile(
                    title: Text(item.spaces),
                    subtitle: Row(children: [
                      Text('${item.rentStartTime} ~ ${item.rentEndTime}',
                          style: const TextStyle(fontSize: 15)),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          '${calculateHourDifference(
                            '${item.rentStartDate} ${item.rentStartTime}',
                            '${item.rentEndDate} ${item.rentEndTime}',
                          )}小時',
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.center, // 對齊到最右邊
                        ),
                      ),
                    ]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${item.price}/hr',
                            style: const TextStyle(fontSize: 15)),
                        addDot(
                            const Text(' 出借中', style: TextStyle(fontSize: 15))),
                      ],
                    ),
                    onTap: () {
                      // 進入車位出借編輯詳細頁面
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AvailableParkingSpacesEdit(
                              community: item.community,
                              spaces: item.spaces,
                              availableID: '1'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // TODO: 新增車位
          },
        ),
      ),
    );
  }
}

// 繪製點點
// 紅點表示出借中 則不可以編輯
// TODO:綠點表示空閑中 可以編輯
Widget addDot(Widget targetWidget) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      targetWidget, // 原始文字
      const SizedBox(width: 5), // 可調整紅點與文字之間的間距
      Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    ],
  );
}

class vacant {
  final String community;
  final String spaces;
  final double price;
  final String rentStartDate;
  final String rentEndDate;
  final String rentStartTime;
  final String rentEndTime;

  vacant(
      {required this.community,
      required this.spaces,
      required this.price,
      required this.rentStartDate,
      required this.rentEndDate,
      required this.rentStartTime,
      required this.rentEndTime});
}

final List<vacant> _vacants = [
  vacant(
    community: "金櫻花園",
    spaces: "B1 - 32",
    price: 10,
    rentStartDate: "2024-06-08",
    rentEndDate: "2024-06-08",
    rentStartTime: "10:20",
    rentEndTime: "11:00",
  ),
  vacant(
    community: "金櫻花園",
    spaces: "B1 - 32",
    price: 0,
    rentStartDate: "2024-06-07",
    rentEndDate: "2024-06-08",
    rentStartTime: "23:00",
    rentEndTime: "08:30",
  ),
];
