import 'package:flutter/material.dart';
import 'my_payment_widgets/my_payment_screen.dart';

class PaymentHomeScreen extends StatelessWidget {
  const PaymentHomeScreen({Key? key, this.mainScreenAnimationController}) : super(key: key);
  final AnimationController? mainScreenAnimationController;
  
  
  
  @override
  Widget build(BuildContext context) {
    return PaymentScreen(
        mainScreenAnimationController: mainScreenAnimationController,
    );
  }
}
