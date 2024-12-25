import 'package:flutter/material.dart';
import 'package:mealsapp/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.onTap});

  final Category category;
  final Function(BuildContext context, Category category) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap(context, category);
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withValues(alpha: 0.55),
                category.color.withValues(alpha: 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
        ));
  }
}
