import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metafit/utils/routes.dart';
import 'package:metafit/view/widgets/NextButton.dart';
import 'package:metafit/view/widgets/custom_textfield_age.dart';

import '../../../../contants/const_colors.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _selectedYear;

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _selectGender(bool isMale) {
    setState(() {
      _isMaleSelected = isMale;
      _isFemaleSelected = !isMale;
    });
  }

  void _validateAndContinue() {
    if (!_isMaleSelected && !_isFemaleSelected) {
      _showToast("Please select atleast gender");
    } else {
      Navigator.pushNamed(context, RouteConstants.goal);
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      // surfaceTintColor: ConstColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstColors.whiteColor,
        surfaceTintColor: ConstColors.whiteColor,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            // icon: const Icon(Icons.chevron_left_rounded
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ConstColors.textColor,
            )),
        actions: [
          SizedBox(
            height: 36.h,
            child: Padding(
              padding: const EdgeInsets.only(right: 26),
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      'STEP 01/03',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ConstColors.appbarStepColor,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          'Info',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ConstColors.textColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  Text(
                    'Tell us more About You',
                    style: TextStyle(
                      color: ConstColors.textColor,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderSelectionCard(
                    isSelected: _isFemaleSelected,
                    label: 'Female',
                    imagePath: 'assets/images/female.png',
                    selectedColor: ConstColors.pinkColor,
                    onTap: () => _selectGender(false),
                  ),
                  GenderSelectionCard(
                    isSelected: _isMaleSelected,
                    label: 'Male',
                    imagePath: 'assets/images/male.png',
                    selectedColor: ConstColors.blueColor,
                    onTap: () => _selectGender(true),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: _ageController,
                prefixText: 'Age',
                suffixHint: 'Year',
                hintText: '00',
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: _heightController,
                prefixText: 'Height',
                suffixHint: 'cm', // Set the initial unit
                hintText: '00',
              ),
              SizedBox(height: 22.h),
              CustomTextField(
                controller: _weightController,
                prefixText: 'Weight',
                suffixHint: 'Kg', // Set the initial unit
                hintText: '00',
              ),
              SizedBox(
                height: 48.h,
              ),
              SizedBox(
                width: 308.w,
                height: 45.h,
                child: NextButton(
                  onPressed: _validateAndContinue,
                  label: 'Save & Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
