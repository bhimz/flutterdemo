import 'package:flutter/material.dart';
import 'package:mealsapp/provider/favourite_meal_provider.dart';
import 'package:mealsapp/provider/filter_provider.dart';
import 'package:mealsapp/route/page_route.dart';
import 'package:mealsapp/screen/categories.dart';
import 'package:mealsapp/screen/filters.dart';
import 'package:mealsapp/screen/meals.dart';
import 'package:mealsapp/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onSelectScreen(String identifier) async{
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        createRoute(target:  FilterScreen(), transition: TransitionType.slideLeft),
        //MaterialPageRoute(
        //  builder: (ctx) => FilterScreen(),
        //),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoryScreen(availableMeals: availableMeals);
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
