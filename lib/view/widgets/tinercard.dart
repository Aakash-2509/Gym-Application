import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metafit/contants/const_colors.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({super.key});

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  List<Map<String, String>> images = [
    {
      'path': 'assets/images/trainer.png',
      'name': 'Emily Blue',
      'age': '25',
      'role': 'Gym Trainer',
      'distance': '5 km away',
    },
    {
      'path': 'assets/images/abc.jpeg',
      'name': 'Aakash',
      'age': '22',
      'role': 'Gym Trainer',
      'distance': '15 km away',
    },
    {
      'path': 'assets/images/waterbottle.jpg',
      'name': 'Bottle',
      'age': '1',
      'role': 'Gym Trainer',
      'distance': '8 km away',
    },
    {
      'path': 'assets/images/arvind.png',
      'name': 'Arvind',
      'age': '26',
      'role': 'Gym Trainer',
      'distance': '1 km away',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        // height: 476.h,
        child: CardSwiper(
          cardsCount: images.length,
          cardBuilder: (context, index, x, y) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index]['path']!,
                    fit: BoxFit.cover,
                  ),
                  // Black gradient from top
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5],
                      ),
                    ),
                  ),
                  // White gradient from bottom
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.5),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: SizedBox(
                      width: 240.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${images[index]['name']}",
                                style: TextStyle(
                                  color: ConstColors.whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.94.sp,
                                ),
                              ),
                              Text(
                                "${images[index]['age']}",
                                style: TextStyle(
                                  color: ConstColors.whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.94.sp,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${images[index]['role']}",
                                style: TextStyle(
                                  color: ConstColors.tinderCardText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.88.sp,
                                ),
                              ),
                              Text(
                                "${images[index]['distance']}",
                                style: TextStyle(
                                  color: ConstColors.tinderCardText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.88.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          allowedSwipeDirection: const AllowedSwipeDirection.only(
            right: true,
            left: true,
            up: true
          ),
          numberOfCardsDisplayed: 2,
          // isLoop: false,
          backCardOffset: const Offset(-20, 0),
          // onSwipe: (previous, current, direction) {
          //   if (direction == CardSwiperDirection.right) {
          //     Fluttertoast.showToast(
          //       toastLength: Toast.LENGTH_SHORT,
          //       msg: '🔥',
          //       backgroundColor: Colors.white,
          //       fontSize: 28,
          //     );
          //   } else if (direction == CardSwiperDirection.left) {
          //     Fluttertoast.showToast(
          //       msg: '😖',
          //       backgroundColor: Colors.white,
          //       fontSize: 28,
          //     );
          //   }
          //   return true;
          // },
        ),
      ),
    );
  }
}
