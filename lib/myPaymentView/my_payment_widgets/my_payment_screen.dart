import 'package:flutter/material.dart';

import '../available_parking_widgets/available_Parking_Spaces.dart';


// 顯示支付/狀態頁面
// 確認目前上架中、租借中、已收款、尚未付款狀態
// 並可進行相關付款操作
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, this.mainScreenAnimationController})
      : super(key: key);
  final AnimationController? mainScreenAnimationController;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
int _menuItemsSelectedIndex = 0;

enum Menu { itemOne, itemTwo, itemThree }

// TODO: 改由API提供
final List<String> _menuItems = <String>[
  'All',
  '金櫻花園',
  '金櫻一品',
  '金櫻廣場',
  '金櫻鎮',
];

// 支付/狀態 主頁面Widget
class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    widget.mainScreenAnimationController?.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "支付 / 狀態",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                if (isLargeScreen) Expanded(child: _navBarItems())
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: _ProfileIcon()),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              crossAxisCount: 2, // 每行兩個按钮
              crossAxisSpacing: 20.0, // 水平間距
              mainAxisSpacing: 20.0, // 垂直間距
              childAspectRatio: 1.0, // 寬高比1:1，形成正方形
              children: [
                _buildButton('上架中', Colors.lightBlue, 1),
                _buildButton('租借中', Colors.lightGreen, 2),
                _buildButton('已收款', Colors.orange, 3),
                _buildButton('尚未付款', Colors.pink, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 建構Body按鈕
  // index : 按鈕順序(動畫用)
  // Interval((1 / (4 + 2)) : 4為按鈕總數
  Widget _buildButton(String text, Color color, int index) {
    Animation<double> buttonAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: widget.mainScreenAnimationController!,
            curve: Interval((1 / (4 + 2)) * (1 + index), 1.0,
                curve: Curves.fastOutSlowIn)));

    return AnimatedBuilder(
        animation: widget.mainScreenAnimationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: buttonAnimation,
              child: Transform.translate(
                  offset: Offset(0.0, 30 * (1.0 - buttonAnimation.value)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        switch (index) {
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AvailableParkingSpaces(community: _menuItems[_menuItemsSelectedIndex]),
                              ),
                            );
                            break;
                          default:
                          // Handle default case here
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 11,
                        backgroundColor: color,
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )));
        });
  }

  // 選擇社區
  // 使用較標準螢幕時收合Items
  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .asMap()
              .entries
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      setState(() {
                        _menuItemsSelectedIndex = item.key;
                      });
                    },
                    title: Text(
                      item.value,
                      style: TextStyle(
                        fontSize: 18,
                        color: _menuItemsSelectedIndex == item.key
                            ? Colors.green // 選中時的顏色
                            : Colors.white, // 未選中時的顏色
                      ),
                    ),
                  ))
              .toList(),
        ),
      );

  // 選擇社區
  // 使用較大螢幕時展開Items內容
  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .asMap()
            .entries
            .map(
              (item) => InkWell(
                onTap: () {
                  setState(() {
                    _menuItemsSelectedIndex = item.key;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 18,
                      color: _menuItemsSelectedIndex == item.key
                          ? Colors.green // 選中時的顏色
                          : Colors.blue, // 未選中時的顏色
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
}

// 右上方頭像Widget
class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Icons.person),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('帳號(考慮可能不使用)'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: Text('設定(考慮可能不使用)'),
              ),
            ]);
  }
}
