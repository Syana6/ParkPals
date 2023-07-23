// 車位詳細資訊頁面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/parkingSpace.dart';

class canRentDetail extends StatelessWidget {
  final ParkingSpace parkingSpace;

  const canRentDetail({Key? key, required this.parkingSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${parkingSpace.owner} ${parkingSpace.floor} ${parkingSpace.space}'),
      ),
      body: Center(
        // TODO: 顯示車位詳細資訊
        child: Image.network('https://example.com/parking_space_image.png'),
      ),
    );
  }
}