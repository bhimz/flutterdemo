import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/model/category.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/route/page_route.dart';
import 'package:mealsapp/widget/category_item.dart';
import 'package:mealsapp/screen/meals.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      createRoute(
        target: MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
      //MaterialPageRoute(
      //  builder: (ctx) => MealsScreen(
      //    title: category.title,
      //    meals: filteredMeals,
      //  ),
      //),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategoryItem(
                category: category,
                onTap: _selectCategory,
              ))
          .toList(),
    );
  }
}
