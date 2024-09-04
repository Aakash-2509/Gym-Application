import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metafit/view/data/workout%20data/workout_program_be_active.dart';
import 'package:metafit/view/data/workout%20data/workout_program_build_muscles.dart';
import 'package:metafit/view/data/workout%20data/workout_program_burn_fats.dart';
import 'package:metafit/view/screens/workout_progrmScreen.dart';

import '../../../../contants/const_colors.dart';
import '../widgets/CardList.dart';
import '../widgets/CustomSlider.dart';
import '../widgets/NextButton.dart';
import '../widgets/PlusMinusCounter.dart';
import '../widgets/custom_textfield_age.dart';

class FitFormScreen extends StatefulWidget {
  const FitFormScreen({super.key});

  @override
  State<FitFormScreen> createState() => _FitFormScreenState();
}

class _FitFormScreenState extends State<FitFormScreen> {
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _neckController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _hipsController = TextEditingController();
  final List<Map<String, String>> cardData = [
    {
      'text': 'Burn Fat',
      'imagePath': 'assets/BurnFat.png',
    },
    {
      'text': 'Be Active',
      'imagePath': 'assets/BeActive.png',
    },
    {
      'text': 'Build Muscle',
      'imagePath': 'assets/BuildMuscle.png',
    },
    {
      'text': 'Eat Healthy',
      'imagePath': 'assets/bowl.png',
    },
  ];

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

  void _selectGender(bool isMale) {
    setState(() {
      _isMaleSelected = isMale;
      _isFemaleSelected = !isMale;
    });
  }

  void _onSaveAndContinue() {
    int selectedCount = selectedCards.where((element) => element).length;
    if (selectedCount > 1) {
      _showSnackBar("Please select only one goal.");
      return;
    }
    if (selectedCount == 0) {
      _showToast("Please select at least one goal.");
      return;
    }
    if (selectedCards[0]) {
      // Assuming "Burn Fat" is at index 0
      // Call the method to display the burn fats program
      _showBurnFatsProgram();
    } else if (selectedCards[2]) {
      // Assuming "Build Muscle" is at index 2
      // Call the method to display the build muscles program
      _showBuildMusclesProgram();
    } else if (selectedCards[1]) {
      _showBeActiveProgram();
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showBurnFatsProgram() {
    // Navigate to a new screen to display the burn fats program
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const WorkoutProgramScreen(programs: burnFatsPrograms),
      ),
    );
  }

  void _showBuildMusclesProgram() {
    // Navigate to a new screen to display the build muscles program
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const WorkoutProgramScreen(programs: buildMusclesPrograms),
      ),
    );
  }

  void _showBeActiveProgram() {
    // Navigate to a new screen to display the build muscles program
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const WorkoutProgramScreen(programs: beActivePrograms),
      ),
    );
  }

  int mealsCount = 3;
  int eatOutCount = 3;
  int waterLiters = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
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
                    "Share your goals & details",
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
                          if (selectedCards
                                      .where((element) => element)
                                      .length >=
                                  1 &&
                              !selectedCards[index]) {
                            _showSnackBar("Please select only one goal.");
                            return;
                          }
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
                  count: mealsCount,
                  onAdd: () {
                    setState(() {
                      mealsCount++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      mealsCount--;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomSlider(
                value: activityLevel,
                onChanged: (value) {
                  setState(() {
                    activityLevel = value;
                  });
                },
              ),
              SizedBox(height: 52.h),
              SizedBox(
                width: 301.w,
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: ConstColors.textColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderSelectionCard(
                    isSelected: _isFemaleSelected,
                    label: 'Female',
                    imagePath: 'assets/images/female.png',
                    selectedColor: ConstColors.pinkColor,
                    onTap: () => _selectGender(false),
                  ),
                  GenderSelectionCard(
                    isSelected: _isMaleSelected,
                    label: 'Male',
                    imagePath: 'assets/images/male.png',
                    selectedColor: ConstColors.blueColor,
                    onTap: () => _selectGender(true),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomTextField(
                controller: _ageController,
                prefixText: 'Age',
                suffixHint: 'Year',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              CustomTextField(
                controller: _heightController,
                prefixText: 'Height',
                suffixHint: 'cm',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              CustomTextField(
                controller: _weightController,
                prefixText: 'Weight',
                suffixHint: 'Kg',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              CustomTextField(
                controller: _neckController,
                prefixText: 'Neck',
                suffixHint: 'cm',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              CustomTextField(
                controller: _waistController,
                prefixText: 'Waist',
                suffixHint: 'cm',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              CustomTextField(
                controller: _hipsController,
                prefixText: 'Hips',
                suffixHint: 'cm',
                hintText: '00',
              ),
              SizedBox(
                height: 38.h,
              ),
              Center(
                child: NextButton(
                  onPressed: _onSaveAndContinue,
                  label: "Save and continue",
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: ConstColors.skipButtonColor,
                    fontSize: 12,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Divider(
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
