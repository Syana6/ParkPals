// 車位詳細資訊頁面
import 'dart:io';
import 'package:flutter/material.dart';

import '../models/responseModels/parking_space.dart';
import '../models/responseModels/rent_object.dart';

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
        child: Image.file(
          File(parkingSpace.image),
          ),
      ),
    );
  }
}