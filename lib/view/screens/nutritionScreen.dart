import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metafit/contants/const_colors.dart';
import 'package:metafit/view/screens/nutrition_deatils_screen.dart';
import 'package:metafit/view/widgets/PlusMinusCounter.dart';
import 'package:metafit/view/widgets/CustomSlider.dart';
import '../widgets/CardList.dart';
import '../widgets/NextButton.dart';

class Nutritionscreen extends StatefulWidget {
  const Nutritionscreen({super.key});

  @override
  State<Nutritionscreen> createState() => _NutritionscreenState();
}

class _NutritionscreenState extends State<Nutritionscreen> {
  final List<Map<String, String>> cardData = [
    {
      'id': 'vegetarian',
      'text': 'Vegetarian',
      'imagePath': 'assets/vagitarian.png',
    },
    {
      'id': 'vegan',
      'text': 'Vegan',
      'imagePath': 'assets/vegan.png',
    },
    {
      'id': 'Non - vegetarian',
      'text': 'Non Veg',
      'imagePath': 'assets/NonVeg.png',
    },
    // {
    //   'id': 'omnivorous',
    //   'text': 'Omnivorous',
    //   'imagePath': 'assets/Omnivirous.png',
    // },
  ];

  double activityLevel = 0;
  double activityLevel2 = 0;
  double activityLevel3 = 0;
  List<bool> selectedCards = [false, false, false, false];
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
              const Text(
                "Tell us about your nutrition",
                style: TextStyle(
                  color: ConstColors.blackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.sp),
              const Text(
                "Share your daily diet details to get the best healthy diet plans.",
                style: TextStyle(
                  color: ConstColors.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 37.sp),
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
              SizedBox(height: 62.h),
              const Center(
                child: Text(
                  "How many Meals?",
                  style: TextStyle(
                    color: ConstColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
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
              SizedBox(height: 62.h),
              const Center(
                child: Text(
                  "How Often do you Eat Out?",
                  style: TextStyle(
                    color: ConstColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: PlusMinusCounter(
                  count: eatOutCount,
                  onAdd: () {
                    setState(() {
                      eatOutCount++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      eatOutCount--;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomSlider(
                value: activityLevel2,
                onChanged: (value) {
                  setState(() {
                    activityLevel2 = value;
                  });
                },
              ),
              SizedBox(height: 62.h),
              const Center(
                child: Text(
                  "How many liters of water?",
                  style: TextStyle(
                    color: ConstColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: PlusMinusCounter(
                  count: waterLiters,
                  onAdd: () {
                    setState(() {
                      waterLiters++;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      waterLiters--;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomSlider(
                value: activityLevel3,
                onChanged: (value) {
                  setState(() {
                    activityLevel3 = value;
                  });
                },
              ),
              const SizedBox(height: 51),
              Center(
                child: NextButton(
                  onPressed: () {
                    List<String> selectedDietIds = [];
                    for (int i = 0; i < selectedCards.length; i++) {
                      if (selectedCards[i]) {
                        selectedDietIds.add(cardData[i]['id']!);
                      }
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NutritionDetailsScreen(
                          selectedDietIds: selectedDietIds,
                          mealsCount: mealsCount,
                          eatOutCount: eatOutCount,
                          waterLiters: waterLiters,
                        ),
                      ),
                    );
                  },
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
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 145,
                indent: 145,
                height: 1.0,
                color: ConstColors.skipButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
