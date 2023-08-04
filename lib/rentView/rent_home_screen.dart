import 'package:flutter/material.dart';
import 'rent_screen.dart';

// main main.dart
// 租借主頁面
class RentHomeScreen extends StatefulWidget {
  const RentHomeScreen({Key? key}) : super(key: key);

  @override
  _RentHomeScreenState createState() => _RentHomeScreenState();
}

class _RentHomeScreenState extends State<RentHomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Widget build (BuildContext context) {
    return RentScreen(
        mainScreenAnimationController: animationController,
    );
  }
}
