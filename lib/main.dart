import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ParkPALsApp());
}

class ParkPALsApp extends StatelessWidget {
  const ParkPALsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '社區車位租借',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: '可租借車位'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 1; // 預設是租借
  String searchValue = '';

  List<ParkingSpace> filteredParkingSpaces = []; // 搜尋後的車位
  AnimationController? animationController;

  @override
  void initState() {
    filteredParkingSpaces = parkingSpaces;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // TODO: 根據選擇的按鈕改變頁面
    });
  }

  // 搜尋車位
  void searchParkingSpaces() {
    setState(() {
      filteredParkingSpaces = parkingSpaces
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '輸入租用開始日期時間',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      // TODO: 在這裡加入選擇日期時間的功能
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '租用小時',
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        // TODO 只能輸入數字
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval(
                          (1 / filteredParkingSpaces.length) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );

                  animationController?.forward();
                  return ParkingSpaceListView(
                    animation: animation,
                    animationController: animationController,
                    listData: filteredParkingSpaces[index],
                    callBack: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                              parkingSpace: filteredParkingSpaces[index]!),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: '出借',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: '租借',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '帳號',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final ParkingSpace parkingSpace;

  const DetailPage({Key? key, required this.parkingSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${parkingSpace.owner} ${parkingSpace.floor} ${parkingSpace.space}'),
      ),
      body: Center(
        // TODO: 替換成從後端取得的車位照片
        child: Image.network('https://example.com/parking_space_image.png'),
      ),
    );
  }
}

class ParkingSpace {
  final String owner;
  final String floor;
  final String space;
  final int price;

  ParkingSpace(this.owner, this.floor, this.space, this.price);
}

List<ParkingSpace> parkingSpaces = [
  ParkingSpace('266-1', '11F', '52號車位', 20),
  ParkingSpace('266-2', '5F', '10號車位', 25),
  ParkingSpace('158-7', '3F', '18號車位', 15),
  ParkingSpace('999-1', '8F', '22號車位', 30),
  ParkingSpace('999-2', '2F', '103號車位', 40),
  ParkingSpace('999-3', '3F', '122號車位', 50),
  ParkingSpace('999-4', '10F', '157號車位', 80),
  ParkingSpace('999-5', '12F', '383號車位', 1),
  ParkingSpace('999-6', '13F', '88號車位', 10),
  ParkingSpace('999-7', '14F', '66號車位', 5),
  // 更多車位...
];

// 自定義ParkingSpaceListView
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
                200 * (1.0 - animation!.value), 0.0, 0.0),
            // 指定子 Widget 的寬高比
            child: AspectRatio(
              aspectRatio: 4.6,
              // 裁剪為圓角矩形形狀
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Card(
                  child: ListTile(
                    title: Text('${listData!.owner} ${listData!.floor} ${listData!.space.padLeft(8)}'),
                    subtitle: Text('每小時\$${listData!.price}'),
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
