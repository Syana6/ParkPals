import 'package:flutter/material.dart';

class AvailableParkingSpaceSetting extends StatelessWidget {
  final String community; // 社區
  final String spaces; // 車位
  const AvailableParkingSpaceSetting(
      {Key? key, required this.community, required this.spaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$community - $spaces 出借資訊',
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
                  child: ListTile(
                    title: Text(item.spaces),
                    subtitle: Text(
                        '${item.rentStartDate} ${item.rentStartTime} ~ ${item.rentEndDate} ${item.rentEndTime}'),
                    trailing: Text('每小時\$${item.price}'),
                    onTap: () {
                      // TODO: 進入車位出借編輯詳細頁面
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => parkingSpaceEdit(space: spaces[index]),
                      //   ),
                      // );
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
