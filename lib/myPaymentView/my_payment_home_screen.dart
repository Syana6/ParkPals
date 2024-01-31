import 'package:flutter/material.dart';

class PaymentHomeScreen extends StatelessWidget {
  const PaymentHomeScreen({Key? key, this.mainScreenAnimationController})
      : super(key: key);
  final AnimationController? mainScreenAnimationController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button Grid'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
              crossAxisCount: 2, // 每行两个按钮
              crossAxisSpacing: 20.0, // 水平间距
              mainAxisSpacing: 20.0, // 垂直间距
              childAspectRatio: 1.0, // 按钮宽高比为1:1，形成正方形
              children: [
                _buildButton('0, 出借中', Colors.lightBlue),
                _buildButton('3, 租借中', Colors.lightGreen),
                _buildButton('待確認收款', Colors.orange),
                _buildButton('尚未付款', Colors.pink),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {},
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
    );
  }
}
