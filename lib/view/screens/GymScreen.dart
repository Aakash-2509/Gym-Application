import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/utils/routes.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'filterScreen.dart';

class Gymscreen extends StatefulWidget {
  const Gymscreen({super.key});

  @override
  State<Gymscreen> createState() => _GymscreenState();
}

class _GymscreenState extends State<Gymscreen> {
  final List<String> imgList = [
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
    'assets/GymImage.png',
  ];
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;
  bool _isSelected4 = false;
  bool _isSelected5 = false;
  bool _isSelected6 = false;
  bool _isSelected7 = false;
  bool _isSelected8 = false;

  double activityLevel = 0;

  // List to keep track of each slider's current index
  final List<int> _currentIndices = List<int>.filled(10, 0);

  void _showExploreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Hello',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Happy to help you in your fitness journey',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // _showExploreDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColors.explore,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 12.sp, horizontal: 24.sp),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'To seamlessly explore all features, ',
                  style: TextStyle(
                      color: ConstColors.alterboxText,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Sign up/ Login to MetaFit ',
                  style: TextStyle(
                      color: ConstColors.alterboxText,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const filterScreen();
      },
    );
  }

// void _showFilterDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Material(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Filter by:",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                               color: ConstColors.blackColor,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             icon: const Icon(Icons.close),
//                           ),
//                         ],
//                       ),
//                       Divider(
//                         height: 2.h,
//                         thickness: 1.sp,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Find On Map",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 color: ConstColors.blackColor,
//                               ),
//                             ),
//                             Text(
//                               "5 Gyms Near you",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300,
//                                 color: ConstColors.selectimage,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Row(
//                                   children: [
//                                     Icon(Icons.location_on_outlined),
//                                     Text(
//                                       "Aundh, Pune",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: ConstColors.selectimage,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.arrow_drop_down),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Container(
//                         height: 150.h,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Image.asset(
//                           "assets/mapImage.png",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "Your Budget",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 color: ConstColors.blackColor,
//                               ),
//                             ),
//                             SizedBox(height: 10.h),
//                             const Text(
//                               "*Per Month",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300,
//                                 color: ConstColors.blackColor,
//                               ),
//                             ),
//                             SizedBox(height: 10.h),
//                             const Text(
//                               " \u{20B9}3000 - \u{20B9}5000 +",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: ConstColors.blackColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Slider(
//                         value: activityLevel,
//                         min: 0,
//                         max: 10,
//                         label: activityLevel.truncate().toString(),
//                         onChanged: (double value) {
//                           setState(() {
//                             activityLevel = value;
//                           });
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Deals",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 color: ConstColors.filterText,
//                               ),
//                             ),
//                             _buildCheckboxOption("All Gyms", "554", _isSelected1,
//                                 (newValue) {
//                               setState(() => _isSelected1 = newValue!);
//                             }),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Popular filters",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 color: ConstColors.filterText,
//                               ),
//                             ),
//                             _buildCheckboxOption("NearBy", "554", _isSelected2,
//                                 (newValue) {
//                               setState(() => _isSelected2 = newValue!);
//                             }),
//                             _buildCheckboxOption("4+ Rating", "554", _isSelected3,
//                                 (newValue) {
//                               setState(() => _isSelected3 = newValue!);
//                             }),
//                             _buildCheckboxOption("AC", "554", _isSelected4,
//                                 (newValue) {
//                               setState(() => _isSelected4 = newValue!);
//                             }),
//                             _buildCheckboxOption(
//                                 "Gym Trainer", "554", _isSelected5, (newValue) {
//                               setState(() => _isSelected5 = newValue!);
//                             }),
//                             _buildCheckboxOption("Sauna", "554", _isSelected6,
//                                 (newValue) {
//                               setState(() => _isSelected6 = newValue!);
//                             }),
//                             _buildCheckboxOption("Classes", "554", _isSelected7,
//                                 (newValue) {
//                               setState(() => _isSelected7 = newValue!);
//                             }),
//                             _buildCheckboxOption(
//                                 "Nutritionist", "554", _isSelected8, (newValue) {
//                               setState(() => _isSelected8 = newValue!);
//                             }),
//                           ],
//                         ),
//                       ),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               side: const BorderSide(color: ConstColors.explore),
//                             ),
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12.sp,
//                               horizontal: 24.sp,
//                             ),
//                           ),
//                           child: const Text(
//                             'Filter Now',
//                             style: TextStyle(
//                               color: ConstColors.explore,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.sp, left: 16.sp, right: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Best Results for you",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: ConstColors.gymdetailsText),
              ),
              IconButton(
                  onPressed: () {
                    _showFilterDialog(context);
                    // Navigator.pushNamed(context, RouteConstants.filter);
                  },
                  icon: const Icon(Icons.filter_list))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.GymDetails);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  height: 465,
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
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 247.h,
                                viewportFraction: 1.0,
                                aspectRatio: 1.0,
                                // autoPlay: true,
                                onPageChanged: (slideIndex, reason) {
                                  setState(() {
                                    _currentIndices[index] = slideIndex;
                                  });
                                },
                              ),
                              items: imgList.map((item) {
                                return Container(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
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
                              height: 10.sp,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 60.sp, left: 60.sp),
                              child: StepProgressIndicator(
                                totalSteps: imgList.length,
                                currentStep: _currentIndices[index] + 1,
                                size: 4,
                                padding: 4,
                                selectedColor: ConstColors.selectimage,
                                unselectedColor: ConstColors.unselectimage,
                                roundedEdges: const Radius.circular(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16.sp),
                        padding: EdgeInsets.all(14.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gym Name ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'details....... ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 35.h,
                                  width: 35.w,
                                  padding:
                                      EdgeInsets.only(right: 4.sp, left: 6.sp),
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
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () {
                                _showExploreDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(
                                      color: ConstColors.explore),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.sp, horizontal: 24.sp),
                              ),
                              child: const Text(
                                'Explore',
                                style: TextStyle(
                                    color: ConstColors.explore, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
