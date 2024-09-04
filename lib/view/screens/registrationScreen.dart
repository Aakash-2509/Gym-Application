import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../contants/const_colors.dart';
import '../../../../utils/routes.dart';
import '../widgets/custom_text_formfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();
  bool _passwordVisible = false;
  bool _termsAccepted = false;
  String currentAddress = '';


  // Future<void> GetLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     log("Location Denied");
  //     LocationPermission ask = await Geolocator.requestPermission();
  //     if (ask == LocationPermission.denied ||
  //         ask == LocationPermission.deniedForever) {
  //       log("Location still denied after request");
  //       return;
  //     }
  //   }

  //   try {
  //     Position currentPosition = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     log("Latitude=${currentPosition.latitude.toString()}");
  //     log("Longitude=${currentPosition.longitude.toString()}");

  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         currentPosition.latitude, currentPosition.longitude);

  //     Placemark place = placemarks[0];

  //     setState(() {
  //       // currentposition = currentPosition;
  //       currentAddress =
  //           "${place.subLocality}, ${place.locality},${place.country}";
  //     });

  //     log("$currentAddress..............");
  //   } catch (e) {
  //     log("Error getting location: $e");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _mobileController.text = '+91 '; // Set initial value
    _mobileController.addListener(() {
      if (!_mobileController.text.startsWith('+91 ')) {
        _mobileController.text = '+91 ';
        _mobileController.selection = TextSelection.fromPosition(
          TextPosition(offset: _mobileController.text.length),
        );
      }
    });
    // GetLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstColors.whiteColor,
        surfaceTintColor: ConstColors.whiteColor,
        toolbarHeight: 80,
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
                          fontSize: 12.sp, color: ConstColors.appbarStepColor),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14.sp, color: ConstColors.textColor),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0.w),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register Individual Account!',
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 7.h),
                          Text(
                            'For the purpose of enhancing your profile, it is required to fill the details.',
                            style: TextStyle(
                              color: ConstColors.textColor,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: _nameController,
                        labelText: 'Your full name*',
                        hintText: 'Invictus Innocent',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      // CustomTextFormField(
                      //   controller: _emailController,
                      //   labelText: 'Email Address',
                      //   hintText: 'Enter email address',
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your email';
                      //     }
                      //     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      //       return 'Please enter a valid email address';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // CustomTextFormField(
                      //   controller: _passwordController,
                      //   labelText: 'Create Password',
                      //   hintText: 'Enter password',
                      //   obscureText: !_passwordVisible,
                      //   suffixIcon: TextButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         _passwordVisible = !_passwordVisible;
                      //       });
                      //     },
                      //     child: Text(
                      //       _passwordVisible ? 'Hide' : 'Show',
                      //       style: TextStyle(
                      //         color: ConstColors.textColor,
                      //         fontSize: 12.sp,
                      //       ),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your password';
                      //     }
                      //     if (value.length < 6) {
                      //       return 'Password must be at least 6 characters long';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      CustomTextFormField(
                        textInputFormatter: [
                          LengthLimitingTextInputFormatter(14),
                          // FilteringTextInputFormatter.allow(
                          //     RegExp(r'^\+?\d*$')),
                        ],
                        controller: _mobileController,
                        labelText: 'Mobile',
                        hintText: '+91 0000000000',
                        keyboardType: TextInputType.phone,
                        isMobileNumber: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value == '+91 ') {
                            return 'Please enter your mobile number';
                          }
                          if (!RegExp(r'^\+91 \d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: ConstColors.blueColor,
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I agree to the terms and conditions',
                        style: TextStyle(
                          color: ConstColors.textColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 308.w,
                    height: 45.h,
                    child: CupertinoButton(
                      color: ConstColors.buttonColor,
                      onPressed: _termsAccepted
                          ? () {
                              if (_formKey.currentState?.validate() == true) {
                                // Handle form submission
                                Navigator.pushNamed(
                                    context, RouteConstants.welcome);
                              }
                            }
                          : null,
                      child: const Text('Register Account'),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: ConstColors.dividerColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color: ConstColors.dividerTextColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: ConstColors.dividerColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 308.w,
                    height: 45.h,
                    child: CupertinoButton(
                      color: ConstColors.whiteColor,
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          // Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                        // GetLocation();
                      },
                      child: const Text(
                        'Register with Google',
                        style: TextStyle(color: ConstColors.blackColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
