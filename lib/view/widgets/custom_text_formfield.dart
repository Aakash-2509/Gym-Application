import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import '../../contants/const_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textInputFormatter;
  final Widget? suffixIcon;
  final bool
      isMobileNumber; // Add this parameter to indicate if the field is for a mobile number

  const CustomTextFormField({
    super.key,
    this.textInputFormatter = const [],
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.isMobileNumber = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14.sp,
            color: ConstColors.textFieldTextColor,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 18,
              offset: const Offset(0, 3),
            ),
          ]),
          child: TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            inputFormatters:
                textInputFormatter, // Conditionally apply the length limiter
            decoration: InputDecoration(
              hintText: hintText,
              labelStyle:
                  TextStyle(color: ConstColors.textColor, fontSize: 12.sp),
              border: const OutlineInputBorder(),
              suffixIcon: suffixIcon,
            ),
            validator: validator,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
