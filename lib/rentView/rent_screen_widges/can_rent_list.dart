import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/fakeData.dart';
import '../../models/parkingSpace.dart';
import 'canRentDetail.dart';

// main rent_screen.dart
// 顯示可租借車位的列表
class CanRentList extends StatefulWidget {
  const CanRentList({Key? key}) : super(key: key);

  @override
  _CanRentListState createState() => _CanRentListState();
}

class _CanRentListState extends State<CanRentList> with TickerProviderStateMixin {
  String searchValue = '';

  List<ParkingSpace> filteredParkingSpaces = []; // 搜尋後的車位
  AnimationController? animationController;

  @override
  void initState() {
    filteredParkingSpaces = fakeParkingSpaces;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1300), vsync: this);

    animationController?.forward();
    super.initState();
  }

  // 搜尋車位
  void searchParkingSpaces() {
    setState(() {
      filteredParkingSpaces = fakeParkingSpaces
          .where((space) => '${space.owner} ${space.floor} ${space.space}'
              .contains(searchValue))
          .toList();
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Widget build (BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '搜尋車位',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      searchValue = value;
                      searchParkingSpaces();
                    },
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: const Icon(Icons.search),
                  onPressed: searchParkingSpaces,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0, left: 12, right: 12),
                scrollDirection: Axis.vertical,
                itemCount: filteredParkingSpaces.length,
                itemBuilder: (context, index) {
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval(
                          (1 / filteredParkingSpaces.length) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );

                  return ParkingSpaceListView(
                    animation: animation,
                    animationController: animationController,
                    listData: filteredParkingSpaces[index],
                    callBack: () {
                      // TODO: 點擊後進入車位詳細資訊頁面
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => canRentDetail(
                              parkingSpace: filteredParkingSpaces[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 自定義ParkingSpaceListView
// 顯示車位資訊
// 處理從右側進入的動畫效果
class ParkingSpaceListView extends StatelessWidget {
  const ParkingSpaceListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final ParkingSpace? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        // 透明度的漸變效果，子 Widget 將根據動畫的進度進行淡入淡出效果
        return FadeTransition(
          opacity: animation!,
          // 進行二維變換，例如平移、縮放和旋轉
          child: Transform(
            transform: Matrix4.translationValues(
                300 * (1.0 - animation!.value), 0.0, 0.0),
            // 指定子 Widget 的寬高比
            child: AspectRatio(
              aspectRatio: 4.6,
              // 裁剪為圓角矩形形狀
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),  // Add some padding
                    title: Container(
                      height: 30.0,  // Adjust this value as needed 
                      child: Column(
                      children: [
                        // Image.network('https://example.com/parking_space_image.png', height: 50, width: 50), // Replace with your image
                        Row(
                            children: [
                              Expanded(child: Text(listData!.owner)), // Make owner take up all the available space
                              Text('每小時\$${listData!.price}'),  // Price will be at the end of the line
                            ],
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            // text floor and space
                            Text(listData!.floor),
                            const SizedBox(width: 5),  // Change the width to height
                            Text(listData!.space),
                          ],
                        ),
                      ],
                    ),
                    onTap: callBack,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


