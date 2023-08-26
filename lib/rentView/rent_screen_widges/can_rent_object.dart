import 'package:flutter/material.dart';
import '../../models/parkingSpace.dart';
import 'canRentDetail.dart';

// main rent_screen.dart
// 顯示可租借車位的列表
class CanRentObject extends StatefulWidget {
  const CanRentObject(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      required this.objectCount,
      required this.objectIndex,
      required this.parkingInfo})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  final int objectCount; // 可停物件總數
  final int objectIndex; // 可停物件Index
  final ParkingSpace parkingInfo; // 可停物件資訊

  @override
  _CanRentObjectState createState() => _CanRentObjectState();
}

class _CanRentObjectState extends State<CanRentObject>
    with TickerProviderStateMixin {

  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1700), vsync: this);
    animationController?.forward();

    super.initState();
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
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 1, 15, 0),
                  child: ParkingSpaceInfo(
                    animation: Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval(
                          (1 / widget.objectCount) * widget.objectIndex,
                          1.0,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    animationController: animationController,
                    parkInfo: widget.parkingInfo,
                    callBack: () {
                      // TODO: 點擊後進入車位詳細資訊頁面
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => canRentDetail(
                            parkingSpace: widget.parkingInfo,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        });
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
                        const EdgeInsets.fromLTRB(13, 8, 13, 5), // Add some padding
                    title: SizedBox(
                      height: 30.0, // Adjust this value as needed
                      child: Column(
                        children: [
                          // Image.network('https://example.com/parking_space_image.png', height: 50, width: 50), // Replace with your image
                          Row(
                            children: [
                              Expanded(
                                  child: Text(parkInfo!.owner)), // Make owner take up all the available space
                              Text('每小時\$${parkInfo!.price}'), // Price will be at the end of the line
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
                            const SizedBox(width: 5), // Change the width to height
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
