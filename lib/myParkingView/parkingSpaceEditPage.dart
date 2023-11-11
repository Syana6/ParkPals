// 出借：編輯指定社區車位頁面
import 'package:flutter/material.dart';
import 'models/responseModels/responseModels/res_parking_space_info.dart';

class parkingSpaceEditPage extends StatefulWidget {
  final resMyRentSpaceInfo space;

  parkingSpaceEditPage({Key? key, required this.space}) : super(key: key);

  @override
  _parkingSpaceEditPageState createState() => _parkingSpaceEditPageState();
}

class _parkingSpaceEditPageState extends State<parkingSpaceEditPage> {
  late TextEditingController ownerController;
  late TextEditingController floorController;
  late TextEditingController spaceController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    ownerController = TextEditingController(text: widget.space.owner);
    floorController = TextEditingController(text: widget.space.floor);
    spaceController = TextEditingController(text: widget.space.space);
    priceController = TextEditingController(text: widget.space.price.toString());
  }

  @override
  void dispose() {
    ownerController.dispose();
    floorController.dispose();
    spaceController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('編輯車位'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: ownerController,
              decoration: InputDecoration(labelText: 'Owner'),
            ),
            TextField(
              controller: floorController,
              decoration: InputDecoration(labelText: 'Floor'),
            ),
            TextField(
              controller: spaceController,
              decoration: InputDecoration(labelText: 'Space'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price per hour'),
            ),
            // You may want to add more fields for editing other data of the ParkingSpace.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          // TODO: save the edited data
        },
      ),
    );
  }
}
