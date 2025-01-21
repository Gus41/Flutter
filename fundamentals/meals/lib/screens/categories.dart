import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorte});
  final Function(Meal meal) onToggleFavorte;

  void _selectCategory(BuildContext context, Category category) {
    final selectedMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealsScreen(title: category.title, meals: selectedMeals, onToggleFavorte:onToggleFavorte ,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final c in availableCategories)
          CategoryItem(
            category: c,
            onSelect: () {
              _selectCategory(context, c);
            },
          )
      ],
    );
  }
}
