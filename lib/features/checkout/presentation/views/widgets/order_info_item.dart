import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subTitleStyle,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: titleStyle ?? Styles.font18BlackW400,
        ),
        Spacer(),
        Text(
          subtitle,
          style: subTitleStyle ?? Styles.font18BlackW400,
        ),
      ],
    );
  }
}
