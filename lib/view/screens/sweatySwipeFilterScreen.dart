import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metafit/utils/routes.dart';

import '../../contants/const_colors.dart';

class Sweatyswipefilterscreen extends StatefulWidget {
  final VoidCallback onBack;

  const Sweatyswipefilterscreen({super.key, required this.onBack});

  @override
  State<Sweatyswipefilterscreen> createState() =>
      _SweatyswipefilterscreenState();
}

class _SweatyswipefilterscreenState extends State<Sweatyswipefilterscreen> {
  String currentAddress = '';

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
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: onBack,
        //   ),
        //   title: const Text("Filter Screen"),
        // ),
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Card(
                color: ConstColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Filter by:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: widget.onBack,
                              child: const Icon(
                                Icons.close,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: ConstColors.sweatyswipedividerColor,
                          thickness:
                              1.0, // You can adjust the thickness as needed
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Find On Map",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "5 Gyms near you",
                              style: TextStyle(
                                  color: ConstColors.selectimage,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/mapImage.png",
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 50,
                              left: 90,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RouteConstants.nearByGymScreen);
                                  },
                                  child: const Text(
                                    "Open In Map",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  ConstColors.selectimage, // Text color
                              backgroundColor:
                                  ConstColors.whiteColor, // Background color
                              fixedSize:
                                  const Size(127, 45), // Width and height
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: ConstColors.selectimage),
                                borderRadius: BorderRadius.circular(
                                    8), // Rectangular shape
                              ),
                            ),
                            child: const Text("Clear All"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
