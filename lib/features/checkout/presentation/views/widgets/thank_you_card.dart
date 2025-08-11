import 'package:checkout_payment_ui/core/utils/styles.dart';
import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 70, horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            'Thank you!',
            style: Styles.font25BlackW500,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Your transaction was successful',
            style: Styles.font20BlackW400,
          ),
          SizedBox(
            height: 40,
          ),
          OrderInfoItem(title: 'Date', subtitle: '01/24/2023'),
          SizedBox(
            height: 18,
          ),
          OrderInfoItem(title: 'Time', subtitle: '10:15 AM'),
          SizedBox(
            height: 18,
          ),
          OrderInfoItem(title: 'To', subtitle: 'Sam Louis'),
          SizedBox(
            height: 30,
          ),
          Divider(
            thickness: 2,
            color: Color(0xffB8B8B8),
          ),
          SizedBox(
            height: 30,
          ),
          OrderInfoItem(
            title: 'Total',
            subtitle: r'50.97$',
            titleStyle: Styles.font25BlackW500,
            subTitleStyle: Styles.font25BlackW500,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/master_card.svg',
                  height: 35,
                  width: 25,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Credit Card\n Mastercard **78 ',
                  style: Styles.font18BlackW400,
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.barcode,
                size: 100,
              ),
              Container(
                height: 58,
                width: 113,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xff34A853),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'PAID',
                    style: Styles.font24BlackW500.copyWith(
                      color: Color(0xff34A853),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
