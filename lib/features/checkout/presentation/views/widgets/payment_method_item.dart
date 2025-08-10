import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItems extends StatelessWidget {
  const PaymentMethodItems({
    super.key,
    required this.currentIndex,
    this.onChangeIndex,
  });

  final int currentIndex;
  final ValueChanged<int>? onChangeIndex;

  VoidCallback _changeValue(int index) {
    return onChangeIndex == null ? () {} : () => onChangeIndex!(index);
  }

  String _selectImage(int index) {
    final images = [
      'assets/svgs/card.svg',
      'assets/svgs/paypal.svg',
      'assets/svgs/apple_pay.svg',
    ];
    return images[index];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        3,
        (index) {
          return GestureDetector(
            onTap: _changeValue(index),
            child: AnimatedContainer(
              height: 75,
              duration: Duration(milliseconds: 500),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  side: BorderSide(
                    width: 2,
                    color: index == currentIndex
                        ? Color(0XFF34A853)
                        : Colors.black,
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: index == currentIndex
                        ? Color(0XFF34A853)
                        : Colors.transparent,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(_selectImage(index)),
              ),
            ),
          );
        },
      ),
    );
  }
}
