import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

const dietInfo = [
  {
    'id': "vegetarian",
    'food': [
      "Eggs: A common source of protein for lacto-ovo-vegetarians.",
      "Dairy Products: Including milk, cheese, and yogurt, often consumed by lacto-vegetarians.",
      "Legumes: Such as lentils, chickpeas, and black beans, which are rich in protein and fiber.",
      "Tofu: A versatile source of protein made from soybeans.",
      "Quinoa: A complete protein and a good source of fiber and various nutrients.",
      "Nuts and Seeds: Including almonds, walnuts, chia seeds, and flaxseeds, which provide healthy fats and protein.",
      "Fruits and Vegetables: A wide variety of fresh produce, providing essential vitamins, minerals, and antioxidants.",
      "Whole Grains: Such as brown rice, oats, and barley, offering fiber and nutrients.",
      "Plant-Based Oils: Like olive oil and coconut oil, used for cooking and dressings.",
      "Plant-Based Milk: Including almond milk, soy milk, and oat milk, as alternatives to dairy milk."
    ]
  },
  {
    'id': "vegan",
    'food': [
      "Avocados: A rich source of healthy fats and various nutrients.",
      "Coconut Oil: Used for cooking and baking in place of animal-based fats.",
      "Nuts and Nut Butters: Providing protein, healthy fats, and essential nutrients.",
      "Seeds: Such as chia seeds, flaxseeds, and hemp seeds, offering protein and omega-3 fatty acids.",
      "Non-Dairy Yogurt: Made from coconut, almond, or soy milk, as a dairy-free alternative.",
      "Nutritional Yeast: Often used to add a cheesy flavor to dishes and as a source of vitamin B12.",
      "Tempeh: A fermented soy product, rich in protein and probiotics.",
      "Plant-Based Protein Powders: Derived from sources like pea, hemp, or rice, for smoothies and shakes.",
      "Whole Grains: Including quinoa, brown rice, and whole wheat, for fiber and nutrients.",
      "Fruits and Vegetables: A diverse range of fresh produce for essential nutrients and antioxidants."
    ]
  },
  {
    'id': "Non - vegetarian",
    'food': [
      "Lean Meats: Such as chicken breast, turkey, and lean cuts of beef or pork.",
      "Fish and Seafood: Including salmon, tuna, shrimp, and mussels, for omega-3 fatty acids and protein.",
      "Eggs: A versatile source of protein and nutrients.",
      "Dairy Products: Such as milk, cheese, and yogurt, providing calcium and protein.",
      "Whole Grains: Including whole wheat bread, brown rice, and quinoa, for fiber and nutrients.",
      "Fruits and Vegetables: A wide variety of fresh produce for essential vitamins, minerals, and antioxidants.",
      "Nuts and Seeds: Providing healthy fats, protein, and essential nutrients.",
      "Legumes: Such as lentils, black beans, and chickpeas, for plant-based protein and fiber.",
      "Healthy Oils: Like olive oil and avocado oil, for cooking and dressings.",
      "Herbs and Spices: Used to enhance flavor and add variety to dishes."
    ]
  }
];

class NutritionDetailsScreen extends StatelessWidget {
  final List<String> selectedDietIds;
  final int mealsCount;
  final int eatOutCount;
  final int waterLiters;

  const NutritionDetailsScreen({
    super.key,
    required this.selectedDietIds,
    required this.mealsCount,
    required this.eatOutCount,
    required this.waterLiters,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Details'),
        // backgroundColor: ConstColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selected Diets:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...selectedDietIds.map((dietId) {
                var diet =
                    dietInfo.firstWhere((element) => element['id'] == dietId);
                var dietIdString = diet['id'] as String;
                var foodList = diet['food'] as List<dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dietIdString,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ...foodList
                        .map<Widget>((foodItem) => Text(foodItem as String))
                        .toList(),
                    const SizedBox(height: 10),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Text('Meals Count: $mealsCount'),
              const SizedBox(height: 10),
              Text('Eat Out Count: $eatOutCount'),
              const SizedBox(height: 10),
              Text('Water Liters: $waterLiters'),
            ],
          ),
        ),
      ),
    );
  }
}