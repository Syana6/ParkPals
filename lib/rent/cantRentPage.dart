import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 顯示可租借車位的頁面
class CantRentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const canRentPage(title: '可租借車位'),
    );;
  }
}

class canRentPage extends StatefulWidget {
  const canRentPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _canRentList createState() => _canRentList();
}

class _canRentList extends State<canRentPage> with TickerProviderStateMixin {
  String searchValue = '';

  List<ParkingSpace> filteredParkingSpaces = []; // 搜尋後的車位
  AnimationController? animationController;

  @override
  void initState() {
    filteredParkingSpaces = parkingSpaces;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);

    super.initState();
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

  Widget build (BuildContext context) {
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
                  final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
                      // TODO: 點擊後進入車位詳細資訊頁面
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
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

// 車位詳細資訊頁面
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
        // TODO: 顯示車位詳細資訊
        child: Image.network('https://example.com/parking_space_image.png'),
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
                    contentPadding: EdgeInsets.all(8.0),  // Add some padding
                    title: Container(
                      height: 30.0,  // Adjust this value as needed 
                      child: Column(
                      children: [
                        // Image.network('https://example.com/parking_space_image.png', height: 50, width: 50), // Replace with your image
                        Row(
                            children: [
                              Expanded(child: Text('${listData!.owner}')), // Make owner take up all the available space
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
                            Text('${listData!.floor}'),
                            SizedBox(width: 5),  // Change the width to height
                            Text('${listData!.space}'),
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


class ParkingSpace {
final String owner;   // 車位擁有者
final String floor;   // 車位樓層
final String space;   // 車位號碼
final int price;      // 租借價格 pre hour
final String image;   // 車位照片

ParkingSpace({
  required this.owner,
  required this.floor,
  required this.space,
  required this.price,
  required this.image,
});
}

List<ParkingSpace> parkingSpaces = <ParkingSpace>[
  ParkingSpace(
    owner: '266-1 11F',
    floor: 'B1',
    space: '52',
    price: 15,
    image: 'assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '預計用Line的名稱',
    floor: 'B1',
    space: 'A02',
    price: 30,
    image: 'assets/images/parking_space_2.jpg',
  ),
  ParkingSpace(
    owner: '沒有Line的名稱就用樓層+車位號碼',
    floor: 'B1',
    space: 'A03',
    price: 25,
    image: 'assets/images/parking_space_3.jpg',
  ),
  ParkingSpace(
    owner: '高小姊接',
    floor: 'B1',
    space: 'A04',
    price: 10,
    image: 'assets/images/parking_space_4.jpg',
  ),
  ParkingSpace(
    owner: '喬瑟夫·喬斯達',
    floor: 'B1',
    space: 'A05',
    price: 0,
    image: 'assets/images/parking_space_5.jpg',
  ),
  ParkingSpace(
    owner: '喬納森·喬斯達',
    floor: 'B1',
    space: 'A06',
    price: 100,
    image: 'assets/images/parking_space_6.jpg',
  ),
  ParkingSpace(
    owner: '空條坑錢承太郎',
    floor: 'B1',
    space: 'A07',
    price: 120,
    image: 'assets/images/parking_space_7.jpg',
  ),
  ParkingSpace(
    owner: '喬魯諾·喬巴納',
    floor: 'B1',
    space: 'A08',
    price: 35,
    image: 'assets/images/parking_space_8.jpg',
  )
];

