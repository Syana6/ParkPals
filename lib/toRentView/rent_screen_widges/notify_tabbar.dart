// 顯示Tab Bard 「租借」、「出借」、「系統通知」
import 'package:flutter/material.dart';

import '../to_rent_screen_theme.dart';

class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({super.key});

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xff1a73e8);
  final _tabs = const [
    Tab(text: '   租借   '),
    Tab(text: '   出借   '),
    Tab(text: '  系統通知  '),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // 限制容器的高度
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 0),
      constraints: const BoxConstraints(maxWidth: 550),
      child: ListView(
        shrinkWrap: true,
        children: [
          /// 第一種Tab
          // Container(
          //   height: kToolbarHeight - 8.0,
          //   decoration: BoxDecoration(
          //     color: Colors.grey.shade200,
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: TabBar(
          //     controller: _tabController,
          //     indicator: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8.0),
          //         color: _selectedColor),
          //     labelColor: Colors.white,
          //     unselectedLabelColor: Colors.black,
          //     tabs: _tabs,
          //   ),
          // ),

          // 第二種Tab
          // TabBar(
          //   controller: _tabController,
          //   tabs: _iconTabs,
          //   unselectedLabelColor: Colors.black,
          //   labelColor: _selectedColor,
          //   indicator: BoxDecoration(
          //     borderRadius: BorderRadius.circular(80.0),
          //     color: _selectedColor.withOpacity(0.2),
          //   ),
          // ),

          // 第三種Tab
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            unselectedLabelColor: Colors.black,
            labelColor: _selectedColor,
            indicator: BoxDecoration(
              color: _selectedColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: RentScreenTheme.nearlyWhite.withOpacity(0.3),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
            ),
          ),
        ]
            .map((item) => Column(
                  /// Added a divider after each item to let the tabbars have room to breathe
                  children: [item, const Divider(color: Colors.transparent)],
                ))
            .toList(),
      ),
    );
  }
}


