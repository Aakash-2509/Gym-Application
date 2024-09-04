import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/view/screens/sweatySwipeScreen.dart';

class Sweatyswipepermissionscreen extends StatefulWidget {
  const Sweatyswipepermissionscreen({super.key});

  @override
  State<Sweatyswipepermissionscreen> createState() =>
      _SweatyswipepermissionscreenState();
}

class _SweatyswipepermissionscreenState
    extends State<Sweatyswipepermissionscreen> {
  String? _selectedOption;
  bool _isAbove18 = false;
  bool isYesSelected = true; // Track the selected option
  bool _showSweatySwipeScreen = false; // Track if we should show the new screen
  final List<String> _options = ["Student", "Employee", "Entrepreneur"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      body: _showSweatySwipeScreen
          ? _buildSweatySwipeScreen()
          : _buildPermissionScreen(),
    );
  }

  Widget _buildPermissionScreen() {
    return SingleChildScrollView(
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
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            "Happy to help you in your fitness journey",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Tell us more about you! *",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // Shadow color with opacity
                                spreadRadius: 2, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 3), // Offset in x and y direction
                              ),
                            ],
                            color: ConstColors.whiteColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.5.sp, vertical: 10.sp),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text('Are you a'),
                                ),
                                Expanded(
                                  flex: 2, // Adjust the flex value as needed
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    value: "Student",
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedOption = newValue;
                                      });
                                    },
                                    icon: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0), // Adjust as needed
                                      child: Icon(Icons.arrow_drop_down),
                                    ),
                                    items: _options.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ConstColors.roleColor,
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          width: 117,
                                          height: 28,
                                          child: Center(child: Text(value)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Do you have a gym membership?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // Shadow color with opacity
                                spreadRadius: 2, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 3), // Offset in x and y direction
                              ),
                            ],
                            color: ConstColors.whiteColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.5.sp, vertical: 10.sp),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isYesSelected =
                                                !isYesSelected; // Toggle the selection
                                          });
                                        },
                                        child: SizedBox(
                                          width: 25,
                                          child: Text(
                                            isYesSelected
                                                ? 'Yes'
                                                : 'No', // Display 'Yes' or 'No' based on selection
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              decoration: isYesSelected
                                                  ? TextDecoration.underline
                                                  : TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: TextField(
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          decoration: const InputDecoration(
                                            hintText:
                                                "Tell us where and it's validity",
                                            hintStyle: TextStyle(
                                              color: ConstColors.hintTextColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: Colors.white,
                              hoverColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              checkColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              value: _isAbove18,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isAbove18 = value ?? false;
                                });
                              },
                            ),
                            const Text("I agree that I am 18+ or above"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add the action to be performed on button press
                              if (_selectedOption != null && _isAbove18) {
                                // Show the new screen
                                setState(() {
                                  _showSweatySwipeScreen = true;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Please complete all fields."),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  ConstColors.doneBtnColor, // Text color
                              backgroundColor:
                                  ConstColors.whiteColor, // Background color
                              fixedSize:
                                  const Size(127, 45), // Width and height
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: ConstColors.doneBtnColor),
                                borderRadius: BorderRadius.circular(
                                    8), // Rectangular shape
                              ),
                            ),
                            child: const Text("Done"),
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
    );
  }

  Widget _buildSweatySwipeScreen() {
    return const Sweatyswipescreen();
  }
}
