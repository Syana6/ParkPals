import 'package:flutter/material.dart';
import 'available_Parking_Spaces_setting.dart';

class AvailableParkingSpaces extends StatelessWidget {
  final String community;
  const AvailableParkingSpaces({Key? key, required this.community})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('$community 上架資訊',
            style: const TextStyle(fontSize: 20),),
        ),
        body: Center(
          child: Container(
            // 設定寬度上限
            constraints: const BoxConstraints(maxWidth: 450),
            child: ListView.builder(
              itemCount: _mySpaces.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _mySpaces[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(18.0),
                  onTap: () {
                    // 點擊列表项时导航到另一个界面
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AvailableParkingSpaceSetting(community:item.community, spaces:item.spaces),
                      ),
                    );
                  },
                  child: Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                        borderRadius: BorderRadius.circular(18.0)),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                item.spaces,
                                style: const TextStyle(fontSize: 16),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                item.community,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )),
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item.imageUrl),
                                ))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MySpace {
  final String spaces;
  final String imageUrl;
  final String community;

  MySpace({required this.spaces, required this.imageUrl, required this.community});
}

final List<MySpace> _mySpaces = [
  MySpace(
    spaces: "B1 - 32",
    community: "金櫻花園",
    imageUrl: "https://picsum.photos/id/1000/960/540",
  ),
  MySpace(
    spaces: "B6-3388",
    imageUrl: "https://picsum.photos/id/1010/960/540",
    community: "金櫻一品",
  ),
  MySpace(
    spaces: "B3-2029",
    community: "金櫻一品",
    imageUrl: "https://picsum.photos/id/1002/960/540",
  ),
  MySpace(
    spaces: "A3-333",
    community: "金櫻廣場",
    imageUrl: "https://picsum.photos/id/1020/960/540",
  ),
  MySpace(
    spaces: "A2-239",
    community: "金櫻廣場",
    imageUrl: "https://picsum.photos/id/1021/960/540",
  ),
];
