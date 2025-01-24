import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favorites = [];
  Map<FilterEnum, bool> _selectedFilters = {
    FilterEnum.glutenFree: false,
    FilterEnum.lactoseFree: false,
    FilterEnum.vegan: false,
    FilterEnum.vegetarian: false
  };

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favorites.contains(meal);
    if (isExisting) {
      setState(() {
        _favorites.remove(meal);
      });
      showInfoMessage("Meal is no longer a favorite");
      return;
    }
    setState(() {
      _favorites.add(meal);
    });
    showInfoMessage("Meal marked as a favorite");
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.pop(context);
      var filters = await Navigator.of(context).push<Map<FilterEnum, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,)));
      setState(() {
        _selectedFilters = filters ?? _selectedFilters;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[FilterEnum.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[FilterEnum.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();


    Widget page = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavorte: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      page = MealsScreen(
        meals: _favorites,
        onToggleFavorte: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
