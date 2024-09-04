import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/utils/routes.dart';
import 'package:metafit/view/widgets/CardList.dart';
import 'package:metafit/view/widgets/NextButton.dart';
import 'package:metafit/view/widgets/PlusMinusCounter.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Map<String, String>> cardData = [
    {
      'text': 'Burn Fat',
      'imagePath': 'assets/BurnFat.png',
    },
    {
      'text': 'Build Muscle',
      'imagePath': 'assets/BuildMuscle.png',
    },
    {
      'text': 'Be Active',
      'imagePath': 'assets/BeActive.png',
    },
    {
      'text': 'Eat Healthy',
      'imagePath': 'assets/EatHealthy.png',
    },
  ];

  int meal = 3;
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
      Navigator.pushNamed(context, RouteConstants.diet);
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
                // icon: const Icon(Icons.chevron_left_rounded
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
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Goals",
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
                    "What is Your Goal",
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
                  "How Active are you",
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
                  count: meal,
                  onAdd: () {
                    setState(() {
                      meal++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      meal--;
                    });
                  },
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(right: 40, left: 40),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Material(
              //         elevation: 4,
              //         shape: CircleBorder(),
              //         child: CircleAvatar(
              //           radius: 20,
              //           backgroundColor: Colors.transparent,
              //           child: Icon(Icons.add, color: Colors.black),
              //         ),
              //       ),
              //       SizedBox(width: 20),
              //       Text(
              //         "3 Days",
              //         style: TextStyle(
              //             color: ConstColors.dayLeftColor,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w600),
              //       ),
              //       SizedBox(width: 20),
              //       Material(
              //         elevation: 4,
              //         shape: CircleBorder(),
              //         child: CircleAvatar(
              //           radius: 20,
              //           backgroundColor: Colors.transparent,
              //           child: Icon(Icons.remove, color: Colors.black),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                  onPressed: _onSaveAndContinue,
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
