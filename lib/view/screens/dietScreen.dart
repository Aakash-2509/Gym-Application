import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/view/widgets/CardList.dart';
import 'package:metafit/view/widgets/NextButton.dart';
import 'package:metafit/view/widgets/PlusMinusCounter.dart';

import '../../../../utils/routes.dart';

class Dietscreen extends StatefulWidget {
  const Dietscreen({super.key});

  @override
  State<Dietscreen> createState() => _DietscreenState();
}

class _DietscreenState extends State<Dietscreen> {
  final List<Map<String, String>> cardData = [
    {
      'text': 'Vegetarian',
      'imagePath': 'assets/vagitarian.png',
    },
    {
      'text': 'Vegan',
      'imagePath': 'assets/vegan.png',
    },
    {
      'text': 'Non Veg',
      'imagePath': 'assets/NonVeg.png',
    },
    {
      'text': 'Omnivorous',
      'imagePath': 'assets/Omnivirous.png',
    },
  ];

  int active = 3;
  double activityLevel = 0;
  List<bool> selectedCards = [false, false, false, false];
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

  void _onSaveAndContinue() {
    if (selectedCards.contains(true)) {
      Navigator.pushReplacementNamed(context, RouteConstants.home);
    } else {
      _showToast("Please select at least one goal.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: AppBar(
        backgroundColor: ConstColors.whiteColor,
        surfaceTintColor: ConstColors.whiteColor,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ConstColors.textColor,
                )),
          ],
        ),
        title: const Text(
          "Back",
          style: TextStyle(
              color: ConstColors.textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "STEPS 01/03",
                  style: TextStyle(
                      color: ConstColors.appbarStepColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Dietary Info",
                  style: TextStyle(
                      color: ConstColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 26, right: 22, left: 22, bottom: 22),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tell us about your Nutrition",
                    style: TextStyle(
                        color: ConstColors.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  const Text(
                    "This helps us understand you and give you the best advice needed to achieve your goals",
                    style: TextStyle(
                        color: ConstColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 37.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 140.sp,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCards[index] = !selectedCards[index];
                        });
                      },
                      child: CustomCard(
                        text: cardData[index]['text']!,
                        imagePath: cardData[index]['imagePath']!,
                        isSelected: selectedCards[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "How many Meals ?",
                  style: TextStyle(
                      color: ConstColors.blackColor,
                      // color: ConstColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: PlusMinusCounter(
                  count: active,
                  onAdd: () {
                    setState(() {
                      active++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      active--;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "0",
                    style: TextStyle(
                        color: ConstColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Slider(
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
                  ),
                  const Text(
                    "10",
                    style: TextStyle(
                        color: ConstColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 51),
              Center(
                child: NextButton(
                  onPressed: () {
                    _onSaveAndContinue();
                  },
                  label: "Save and continue",
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                  child: Text("Skip",
                      style: TextStyle(
                        color: ConstColors.skipButtonColor,
                        fontSize: 12,
                        // decoration: TextDecoration.underline,
                      ))),
              Divider(
                thickness: 1,
                endIndent: 145,
                indent: 145,
                height: 1.0,
                color: ConstColors.skipButtonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
