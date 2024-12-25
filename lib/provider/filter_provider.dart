import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/meal_provider.dart';
import 'package:mealsapp/screen/filters.dart';

const kInitialFilters = {
  FilterOptions.glutenFree: false,
  FilterOptions.lactoseFree: false,
  FilterOptions.vegetarian: false,
  FilterOptions.vegan: false,
};

class FilterNotifier extends StateNotifier<Map<FilterOptions, bool>> {
  FilterNotifier() : super(kInitialFilters);

  void toggleFilter(FilterOptions filter) {
    state = Map.from(state)..update(filter, (value) => !value);
  }

  void setFilters(Map<FilterOptions, bool> filters) {
    state = Map.from(filters);
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<FilterOptions, bool>>((ref) {
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilters[FilterOptions.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[FilterOptions.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[FilterOptions.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[FilterOptions.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
},);