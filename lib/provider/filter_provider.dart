import 'package:flutter_riverpod/flutter_riverpod.dart';
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