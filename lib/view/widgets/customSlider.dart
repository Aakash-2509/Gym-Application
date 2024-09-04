import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "0",
          style: TextStyle(
            color: ConstColors.sliderTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 10,
            label: value.truncate().toString(),
            onChanged: onChanged,
          ),
        ),
        const Text(
          "10",
          style: TextStyle(
            color: ConstColors.sliderTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
