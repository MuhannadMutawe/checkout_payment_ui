import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment Details',
          style: Styles.font25BlackW500,
        ),
        elevation: 0,
        leadingWidth: 70,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}
