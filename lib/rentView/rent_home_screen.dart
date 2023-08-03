import 'package:flutter/material.dart';
import 'ui_view/omni_datetime_picker.dart';
import 'ui_view/select_date_view.dart';

// main main.dart
// 租借主頁面
class RentHomeScreen extends StatefulWidget {
  const RentHomeScreen({Key? key, required this.title}) : super(key: key);
  final String title; // TODO: 再思考下這邊要放什麼文字

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
    return SelectDateView();
    //  return RentScreen(

    //  );
  }
}
