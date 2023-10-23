import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  static const bgRedColor = Color(0xffD91E2A);
  static const bgWhiteColor = Colors.white;

  const CustomRadioButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

// setState(() {
// selected = index;
// print('ini print dari index: $selected');
// });