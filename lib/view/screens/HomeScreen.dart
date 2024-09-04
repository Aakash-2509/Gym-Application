import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/view/screens/GymScreen.dart';
import 'package:metafit/view/screens/nutritionScreen.dart';
import 'package:metafit/view/screens/sweatySwipePermissionScreen.dart';

import 'fitFormScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );

    // Add listener to track tab changes
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      // Update the state to reflect the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.sp,
        backgroundColor: ConstColors.appbarcolor, // ConstColors.appbarcolor,
        leading: IconButton(
          icon: Image.asset('assets/LogometaFitLogo.png'), // Path to your image
          onPressed: () {
            // Handle the press action here
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(5),
                indicatorWeight: 3, // Adjust the width of the indicator here
                labelColor:
                    Colors.red, // Change text color of selected tab to red
                unselectedLabelColor: Colors
                    .white, // Change text color of unselected tabs to white
                tabs: [
                  Tab(
                    child: TabItem(
                      icon: Icons.fitness_center,
                      text: 'Gym',
                      isSelected: _tabController.index ==
                          0, // Check if this tab is selected
                    ),
                  ),
                  Tab(
                    child: TabItem(
                      icon: Icons.directions_run,
                      text: 'Sweaty Swip',
                      isSelected: _tabController.index == 1,
                    ),
                  ),
                  Tab(
                    child: TabItem(
                      icon: Icons.favorite,
                      text: 'Fitness',
                      isSelected: _tabController.index == 2,
                    ),
                  ),
                  Tab(
                    child: TabItem(
                      icon: Icons.restaurant,
                      text: 'Nutrition',
                      isSelected: _tabController.index == 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                Gymscreen(),
                Sweatyswipepermissionscreen(),
                FitFormScreen(),
                Nutritionscreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const TabItem({
    required this.icon,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.red : Colors.white,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.red : Colors.white,
          ),
        ),
      ],
    );
  }
}
