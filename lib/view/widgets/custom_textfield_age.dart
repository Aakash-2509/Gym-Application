import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../contants/const_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String prefixText;
  final String suffixHint;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.prefixText,
    required this.suffixHint,
    required this.hintText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String currentUnit = '';

  @override
  void initState() {
    super.initState();
    currentUnit = widget.suffixHint; // Set the initial unit
  }

  void toggleUnit() {
    setState(() {
      switch (widget.prefixText) {
        case 'Height':
          currentUnit = (currentUnit == 'cm') ? 'ft' : 'cm';
          break;
        case 'Weight':
          currentUnit = (currentUnit == 'Kg') ? 'lbs' : 'Kg';
          break;
        case 'Neck':
        case 'Waist':
        case 'Hips':
          currentUnit = (currentUnit == 'cm') ? 'm' : 'cm';
          break;
        default:
          // Handle unexpected prefixText values if necessary
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 18,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              widget.prefixText,
            ),
          ),
          SizedBox(
            width: 40,
            child: Expanded(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: ConstColors.agehintTextColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            // height: 50,
            width: 30,
            child: GestureDetector(
              onTap: toggleUnit,
              child: Text(
                currentUnit, // Use currentUnit instead of widget.suffixHint
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderSelectionCard extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String imagePath;
  final Color selectedColor;
  final VoidCallback onTap;

  const GenderSelectionCard({
    super.key,
    required this.isSelected,
    required this.label,
    required this.imagePath,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 143.w,
        height: 67.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? selectedColor.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 18,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? selectedColor : ConstColors.genderTextColor,
                ),
              ),
              Image.asset(
                imagePath, // Replace with your image asset
                width: 32.w,
                height: 52.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxOption(
      String title, bool isSelected, ValueChanged<bool?> onChanged) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(title),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: Colors.blue,
              checkColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
