import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

// Define the reusable NextButton widget
class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const NextButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 21, left: 21),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstColors.buttonColor,
          minimumSize: const Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
              color: ConstColors.buttonTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
        child: Text(label,
            style: TextStyle(color: ConstColors.buttonTextColor, fontSize: 12)),
      ),
    );
  }
}
