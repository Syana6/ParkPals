import 'dart:io';
import 'package:flutter/material.dart';
import '../../apis/fakeData.dart';
import '../models/responseModels/responseModels/res_parking_space_info.dart';
import 'parking_space_edit.dart';

// 出借：顯示指定社區上架車位的頁面
class parkingCommunity extends StatefulWidget {
  final String community;

  parkingCommunity({Key? key, required this.community}) : super(key: key);

  @override
  _SpaceListPageState createState() => _SpaceListPageState();
}

class _SpaceListPageState extends State<parkingCommunity> {
  List<resMyRentSpaceInfo> spaces = fakeParkingSpaces;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.community} 已上架車位'),
      ),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              // Todo: 顯示車位縮圖
              // leading: Image.network(spaces[index].image),
              leading: Image.file(
                File(spaces[index].image),
                fit: BoxFit.cover,
              ),
              title: Text('${spaces[index].owner}'),
              subtitle: Text('${spaces[index].floor} ${spaces[index].space}'),
              trailing: Text('每小時\$${spaces[index].price}'),
              onTap: () {
                // TODO: 進入車位編輯詳細頁面
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => parkingSpaceEdit(space: spaces[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: 新增車位
        },
      ),
    );
  }
}