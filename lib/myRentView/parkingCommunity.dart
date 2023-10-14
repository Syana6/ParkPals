import 'package:flutter/material.dart';
import 'package:parkpals/myRentView/parkingSpaceList.dart';

import '../toRentView/models/fakeData.dart';
import '../toRentView/models/responseModels/parking_space.dart';

// 顯示上架車位社區的頁面
// todo： 尚未登錄過車位的使用者，要先登錄車位才能看到這個頁面

class parkingCommunity extends StatefulWidget {
  const parkingCommunity({Key? key}) : super(key: key);

  @override
  _listParkings createState() => _listParkings();
}

class _listParkings extends State<parkingCommunity> with TickerProviderStateMixin {
  AnimationController? animationController;
  late List<Communities> communities;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);

    // todo: 更改成你的社區清單
    communities = fakeCommunities;

    super.initState();
  } 

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(communities[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => parkingSpaceList(community: communities[index].name)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}