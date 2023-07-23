import 'package:flutter/material.dart';
import 'package:parkpals/forRentView/parkingSpaceEditPage.dart';
import '../models/fakeData.dart';
import '../models/parkingSpace.dart';

// 顯示指定社區上架車位的頁面
class parkingSpaceList extends StatefulWidget {
  final String community;

  parkingSpaceList({Key? key, required this.community}) : super(key: key);

  @override
  _SpaceListPageState createState() => _SpaceListPageState();
}

class _SpaceListPageState extends State<parkingSpaceList> {
  List<ParkingSpace> spaces = fakeParkingSpaces;

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
              leading: Image.network(spaces[index].image),
              title: Text('${spaces[index].owner}'),
              subtitle: Text('${spaces[index].floor} ${spaces[index].space}'),
              trailing: Text('每小時\$${spaces[index].price}'),
              onTap: () {
                // TODO: 進入車位編輯詳細頁面
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => parkingSpaceEditPage(space: spaces[index]),
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