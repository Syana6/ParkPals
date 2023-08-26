import 'package:flutter/material.dart';
import '../models/fakeData.dart';
import '../../models/parkingSpace.dart';
import 'canRentDetail.dart';
 
// main rent_screen.dart
// 顯示可租借車位的列表
// Demo 未使用
class CanRentList extends StatefulWidget {
  const CanRentList(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);
 
  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
 
  @override
  _CanRentListState createState() => _CanRentListState();
}
 
class _CanRentListState extends State<CanRentList>
    with TickerProviderStateMixin {
  String searchValue = '';
 
  List<ParkingSpace> filteredParkingSpaces = []; // 搜尋後的車位
  AnimationController? animationController;
 
  @override
  void initState() {
    filteredParkingSpaces = fakeParkingSpaces;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
 
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
 
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform.translate(
            offset: Offset(0.0, 30 * (1.0 - widget.mainScreenAnimation!.value)),
            child: 
            SizedBox(
              height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.bottom - 220, // 動態占用螢幕剩餘高度 或525
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 0, left: 12, right: 12),
                        scrollDirection: Axis.vertical,
                        itemCount: filteredParkingSpaces.length,
                        itemBuilder: (BuildContext context, index) {
                          final Animation<double> animation = Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(
                            CurvedAnimation(
                              parent: animationController!,
                              curve: Interval(
                                (1 / filteredParkingSpaces.length) * index,
                                1.0,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                          );
 
                          return ParkingSpaceInfo(
                            animation: animation,
                            animationController: animationController,
                            parkInfo: filteredParkingSpaces[index],
                            callBack: () {
                              // TODO: 點擊後進入車位詳細資訊頁面
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => canRentDetail(
                                    parkingSpace: filteredParkingSpaces[index],
                                  ),
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
            ),
          ),
        );
      },
    );
  }
}
 
// 車位資訊小卡
// 處理從右側進入的動畫效果
class ParkingSpaceInfo extends StatelessWidget {
  const ParkingSpaceInfo(
      {Key? key,
      this.parkInfo,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);
 
  final ParkingSpace? parkInfo;
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
                    contentPadding:
                        const EdgeInsets.all(10.0), // Add some padding
                    title: SizedBox(
                      height: 30.0, // Adjust this value as needed
                      child: Column(
                        children: [
                          // Image.network('https://example.com/parking_space_image.png', height: 50, width: 50), // Replace with your image
                          Row(
                            children: [
                              Expanded(
                                  child: Text(parkInfo!
                                      .owner)), // Make owner take up all the available space
                              Text(
                                  '每小時\$${parkInfo!.price}'), // Price will be at the end of the line
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
                            Text(parkInfo!.floor),
                            const SizedBox(
                                width: 5), // Change the width to height
                            Text(parkInfo!.space),
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
 