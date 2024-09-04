import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/utils/routes.dart';

class filterScreen extends StatefulWidget {
  const filterScreen({super.key});

  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;
  String currentAddress = '';
  double activityLevel = 0;
  int active = 3;

  Future<void> GetLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
      if (ask == LocationPermission.denied ||
          ask == LocationPermission.deniedForever) {
        log("Location still denied after request");
        return;
      }
    }

    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentPosition.latitude.toString()}");
      log("Longitude=${currentPosition.longitude.toString()}");

      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        // currentposition = currentPosition;
        currentAddress = " ${place.locality}";
      });

      log("$currentAddress..............");
    } catch (e) {
      log("Error getting location: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    GetLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Filter by:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ConstColors.blackColor),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close)),
                      ],
                    ),
                    Divider(
                      height: 2.h,
                      thickness: 1.sp,
                      // indent: 5.sp,
                      // endIndent: 5.sp,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find On Map",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.blackColor),
                          ),
                          Text(
                            "5 Gyms Near you",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: ConstColors.selectimage),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  Text(
                                    currentAddress.isEmpty
                                        ? "Fetching location..."
                                        : currentAddress,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ConstColors.selectimage),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.nearByGymScreen);
                        },
                        child: Image.asset(
                          "assets/mapImage.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Budget",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.blackColor),
                          ),
                          SizedBox(height: 10.h),
                          const Text(
                            "*Per Month",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: ConstColors.blackColor),
                          ),
                          SizedBox(height: 10.h),
                          const Text(
                            " \u{20B9}3000 - \u{20B9}5000 +",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ConstColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: activityLevel,
                      min: 0,
                      max: 10,
                      // divisions: 10,
                      label: activityLevel.truncate().toString(),
                      onChanged: (double value) {
                        setState(() {
                          activityLevel = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deals",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.filterText),
                          ),
                          _buildCheckboxOption("All Gyms", "554", _isSelected1,
                              (newValue) {
                            setState(() => _isSelected1 = newValue!);
                          }),
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Popular filters",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ConstColors.filterText),
                          ),
                          _buildCheckboxOption("NearBy", "554", _isSelected2,
                              (newValue) {
                            setState(() => _isSelected2 = newValue!);
                          }),
                          _buildCheckboxOption("4+ Rating", "554", _isSelected3,
                              (newValue) {
                            setState(() => _isSelected3 = newValue!);
                          }),
                          _buildCheckboxOption("AC", "554", _isSelected4,
                              (newValue) {
                            setState(() => _isSelected4 = newValue!);
                          }),
                          _buildCheckboxOption(
                              "Gym Trainer", "554", _isSelected5, (newValue) {
                            setState(() => _isSelected5 = newValue!);
                          }),
                          _buildCheckboxOption("Sauna", "554", _isSelected6,
                              (newValue) {
                            setState(() => _isSelected6 = newValue!);
                          }),
                          _buildCheckboxOption("Classes", "554", _isSelected7,
                              (newValue) {
                            setState(() => _isSelected7 = newValue!);
                          }),
                          _buildCheckboxOption(
                              "Nutritionist", "554", _isSelected8, (newValue) {
                            setState(() => _isSelected8 = newValue!);
                          }),
                        ],
                      ),
                    ),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: ConstColors.explore),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.sp, horizontal: 24.sp),
                        ),
                        child: const Text(
                          'Filter Now',
                          style: TextStyle(
                              color: ConstColors.explore, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxOption(String title, String total, bool isSelected,
      ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: Colors.blue,
              checkColor: Colors.white,
            ),
            Text(title),
          ],
        ),
        Text(total)
      ],
    );
  }
}
