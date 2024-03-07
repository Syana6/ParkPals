import 'package:flutter/material.dart';
import '../apis/fakeData.dart';
import 'models/responseModels/responseModels/res_parking_space_info.dart';
import 'parking_screen_theme.dart';
import 'ui_view/parking_community.dart';

// 出借：顯示上架車位社區的頁面
// todo： 尚未登錄過車位的使用者，要先登錄車位才能看到這個頁面

class parkingHome extends StatefulWidget {
  const parkingHome({Key? key}) : super(key: key);

  @override
  _listParkings createState() => _listParkings();
}

class _listParkings extends State<parkingHome>
    with TickerProviderStateMixin {
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
      backgroundColor: ParkingScreenTheme.background,
      appBar: AppBar(
        title: const Text('我的社區'),
      ),
      body: ListView.builder(
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(communities[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          parkingCommunity(community: communities[index].name)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
