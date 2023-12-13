import 'package:flutter/material.dart';

Widget NotificateBell(){
return Container(
  width: 30,
  height: 30,
  child: Stack(
    children: [
      const Icon(
        Icons.notifications,
        color: Colors.black,
        size: 30,
      ),
      Container(
        width: 30,
        height: 30,
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 5),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffc32c37), // TODO:從API取得是否有未處理通知
              border: Border.all(color: Colors.white, width: 1)),
          // child: Padding( // 需要顯示數量時再來控制這邊的_counter
          //   padding: const EdgeInsets.all(0.0),
          //   child: Center(
          //     child: Text(
          //       _counter.toString(),
          //       style: TextStyle(fontSize: 10),
          //     ),
          //   ),
          // ),
        ),
      ),
    ],
  ),
);
}

// void _incrementCounter() {
// setState(() {
//   _counter++;
// });
// }