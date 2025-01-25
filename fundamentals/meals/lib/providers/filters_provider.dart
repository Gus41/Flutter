import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';
enum FilterEnum { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<FilterEnum,bool>>{
  FilterNotifier() : super({
    FilterEnum.glutenFree: false,
    FilterEnum.lactoseFree: false, 
    FilterEnum.vegan: false, 
    FilterEnum.vegetarian: false});

    void setFilter(FilterEnum filter, bool isActive){
      state = {
        ...state,
        filter: isActive
      };
    }
    void setFilters(Map<FilterEnum,bool> filters){
      state = filters;
    }
}


final filtersProvider = StateNotifierProvider<FilterNotifier,Map<FilterEnum,bool>>((ref){
  return FilterNotifier();
});

//---------------------------------------------------

final filteredMealsProvider = Provider((ref){

  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  
  return meals.where((meal) {
      if (activeFilters[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[FilterEnum.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[FilterEnum.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});