import 'package:checkout_payment_ui/features/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 22, left: 22, bottom: 60),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.22,
            left: 28,
            right: 28,
            child: Row(
              children: List.generate(25, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xffB8B8B8)
                    ),
                  ),
                );
              },),
            )
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: -50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
