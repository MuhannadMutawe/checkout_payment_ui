import 'package:flutter/material.dart';

import '../utils/styles.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.label,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF34A853),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        minimumSize: Size(double.infinity, 65),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.black,
            )
          : Text(
              label,
              style: Styles.font22BlackW500,
            ),
    );
  }
}
