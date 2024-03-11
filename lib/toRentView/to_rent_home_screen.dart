import 'package:flutter/material.dart';
import 'rent_screen_widgets/to_rent_screen.dart';

// main main.dart
// 租借主頁面
class RentHomeScreen extends StatefulWidget {
  const RentHomeScreen({Key? key, this.mainScreenAnimationController}) : super(key: key);
  final AnimationController? mainScreenAnimationController;

  @override
  _RentHomeScreenState createState() => _RentHomeScreenState();
}

class _RentHomeScreenState extends State<RentHomeScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build (BuildContext context) {
    return ToRentScreen(
        mainScreenAnimationController: widget.mainScreenAnimationController,
    );
  }
}
