import 'package:flutter/material.dart';

// 顯示支付頁面
// 確認目前出借中數量、租借中數量、收款、付款狀態
// 並可進行相關付款操作
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, this.mainScreenAnimationController})
      : super(key: key);
  final AnimationController? mainScreenAnimationController;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    widget.mainScreenAnimationController?.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支付'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2, // 每行兩個按钮
            crossAxisSpacing: 20.0, // 水平間距
            mainAxisSpacing: 20.0, // 垂直間距
            childAspectRatio: 1.0, // 寬高比1:1，形成正方形
            children: [
              _buildButton('0, 出借中', Colors.lightBlue, 1),
              _buildButton('3, 租借中', Colors.lightGreen, 2),
              _buildButton('待確認收款', Colors.orange, 3),
              _buildButton('尚未付款', Colors.pink, 4),
            ],
          ),
        ),
      ),
    );
  }

  // 按鈕建構
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
                  )));
        });
  }
}
