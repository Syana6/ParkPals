// 租借：車位詳細資訊頁面
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/responseModels/res_rent_space_info.dart';

class toRentDetail extends StatelessWidget {
  final resRentSpaceInfo parkingSpace;

  const toRentDetail({Key? key, required this.parkingSpace}) : super(key: key);

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