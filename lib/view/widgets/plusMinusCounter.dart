import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

class PlusMinusCounter extends StatelessWidget {
  final int count;
  final int minValue = 0;
  final int maxValue = 10;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const PlusMinusCounter({
    Key? key,
    required this.count,
    // required this.minValue,
    // required this.maxValue,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          elevation: 4,
          shape: const CircleBorder(),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.remove, color: Colors.black),
              onPressed: count > minValue ? onRemove : null,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          count.toString(),
          style: const TextStyle(
            color: ConstColors.dayLeftColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 20),
        Material(
          elevation: 4,
          shape: const CircleBorder(),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: count < maxValue ? onAdd : null,
            ),
          ),
        ),
      ],
    );
  }
}
