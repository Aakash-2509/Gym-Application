import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/contants/const_colors.dart';

class GymDetails extends StatefulWidget {
  const GymDetails({super.key});

  @override
  State<GymDetails> createState() => _GymDetailsState();
}

class _GymDetailsState extends State<GymDetails> {
  final List<String> imgList = [
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
  ];

  final List<Map<String, String>> carouselData = [
    {
      'duration': '3 months',
      'points':
          '• Torem ipsum dolor sit amet, consectetur adipiscing elit. \n\t• Nunc vulputate libero et velit interdum, ac aliquet odio mattis. \n• Class aptent taciti sociosqu ad litora torquent per conubia nostra,\n• per inceptos himenaeos. ',
    },
    {
      'duration': '6 months',
      'points':
          '• Torem ipsum dolor sit amet, consectetur adipiscing elit. \n• Nunc vulputate libero et velit interdum, ac aliquet odio mattis. \n• Class aptent taciti sociosqu ad litora torquent per conubia nostra,\n• per inceptos himenaeos. ',
    },
    {
      'duration': '12 months',
      'points':
          '• Torem ipsum dolor sit amet, consectetur adipiscing elit. \n• Nunc vulputate libero et velit interdum, ac aliquet odio mattis. \n• Class aptent taciti sociosqu ad litora torquent per conubia nostra,\n• per inceptos himenaeos. ',
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstColors.whiteColor,
        surfaceTintColor: ConstColors.whiteColor,
        leading: IconButton(onPressed: () {

          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABS FITNESS CAMP. PUNE",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Westport , Baner Pune",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      height: 34.h,
                      width: 34.h,
                      decoration: BoxDecoration(
                        color: ConstColors.whiteColor,
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
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          // radius: 5,
                          backgroundColor: ConstColors.gymdetailsicon,
                          child: Icon(
                            Icons.location_on,
                            size: 25,
                            color: ConstColors.explore,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.h,
                    viewportFraction: 1.0,
                    aspectRatio: 1.0,
                    // autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imgList.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ConstColors.whiteColor,
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
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: Center(
                          child: Image.asset(item,
                              fit: BoxFit.cover, height: 247.h),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: const Text(
                        "Sorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 35.h,
                      width: 35.w,
                      padding: EdgeInsets.only(right: 4.sp, left: 6.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ConstColors.Rating,
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    // height: 350.h,
                    viewportFraction: 1.0,
                    aspectRatio: 1.0,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: carouselData
                      .map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: ConstColors.whiteColor,
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
                          child: Column(
                            children: [
                              Text(
                                item['duration']!,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                item['points']!,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ConstColors.appbarStepColor),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // _showExploreDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ConstColors.explore,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.sp, horizontal: 24.sp),
                                    ),
                                    child: const Text(
                                      'Buy Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // _showExploreDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ConstColors.explore,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.sp, horizontal: 24.sp),
                                    ),
                                    child: const Text(
                                      'Bid Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      .take(3)
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
