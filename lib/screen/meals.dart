import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/screen/meal_detail.dart';
import 'package:mealsapp/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('No meals found'),
                SizedBox(height: 16),
                Text(
                  'Please select another category',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              selectMeal: _selectMeal,
            ),
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
