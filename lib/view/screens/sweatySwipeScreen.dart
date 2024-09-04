import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/view/screens/sweatySwipeFilterScreen.dart';
import 'package:metafit/view/screens/sweatySwipeMessageScreen.dart';
import 'package:metafit/view/widgets/tinercard.dart';
import '../../../../contants/const_colors.dart';

class Sweatyswipescreen extends StatefulWidget {
  const Sweatyswipescreen({super.key});

  @override
  State<Sweatyswipescreen> createState() => _SweatyswipescreenState();
}

class _SweatyswipescreenState extends State<Sweatyswipescreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showMessageScreen = false;
  bool _showFilterScreen = false;

  final List<String> _profiles = [
    'assets/images/trainer.png',
    'assets/images/abc.jpeg',
    'assets/images/waterbottle.jpg',
  ];

  void _nextPage() {
    if (_currentPage < _profiles.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _messageScreen() {
    setState(() {
      _showMessageScreen = true;
      _showFilterScreen = false;
    });
  }

  void _filterScreen() {
    setState(() {
      _showFilterScreen = true;
      _showMessageScreen = false;
    });
  }

  void _backToSwipeScreen() {
    setState(() {
      _showMessageScreen = false;
      _showFilterScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      body: _showMessageScreen
          ? _buildMessageScreen()
          : _showFilterScreen
              ? _buildFilterScreen()
              : _buildSwipeScreen(),
    );
  }

  Widget _buildSwipeScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.42, right: 18.07, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_alt_sharp),
                  onPressed: _filterScreen,
                ),
                IconButton(
                  icon: const Icon(Icons.messenger_outline_sharp),
                  onPressed: _messageScreen,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 11.3.h,
          ),
          SizedBox(
            height: 450.h,
            width: 334.w,
            child: const TinderCard(),
          ),
          SizedBox(
            height: 3.28.h,
          ),
          SizedBox(
            height: 46.6.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 46.25.h,
                  width: 46.25.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15.6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 17.55.h,
                    width: 17.55.w,
                    child: const Icon(Icons.close,
                        color: ConstColors.sweatyIconColor),
                  ),
                ),
                SizedBox(width: 41.w),
                Container(
                  height: 46.25.h,
                  width: 46.25.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15.6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 17.55.h,
                    width: 17.55.w,
                    child: const Icon(
                      Icons.star,
                      color: ConstColors.sweatyStarIconColor,
                    ),
                  ),
                ),
                SizedBox(width: 41.w),
                Container(
                  height: 46.25.h,
                  width: 46.25.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15.6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 17.55.h,
                    width: 17.55.w,
                    child: const Icon(Icons.check,
                        color: ConstColors.sweatyIconColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  Widget _buildMessageScreen() {
    return Sweatyswipemessagescreen(onBack: _backToSwipeScreen);
  }

  Widget _buildFilterScreen() {
    return Sweatyswipefilterscreen(onBack: _backToSwipeScreen);
  }
}
