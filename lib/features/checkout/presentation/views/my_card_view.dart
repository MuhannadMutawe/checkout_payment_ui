import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/my_card_view_body.dart';
import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Card',
          style: Styles.font25BlackW500,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 70,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 28,
        ),
      ),
      body: MyCardViewBody(),
    );
  }
}
