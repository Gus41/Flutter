import 'package:flutter/material.dart';

enum FilterEnum { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<FilterEnum, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();

    _glutenFree = widget.currentFilters[FilterEnum.glutenFree]!;
    _vegan = widget.currentFilters[FilterEnum.vegan]!;
    _lactoseFree = widget.currentFilters[FilterEnum.lactoseFree]!;
    _vegeterian = widget.currentFilters[FilterEnum.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            FilterEnum.glutenFree: _glutenFree,
            FilterEnum.lactoseFree: _lactoseFree,
            FilterEnum.vegetarian: _vegeterian,
            FilterEnum.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
              onChanged: (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              title: Text(
                "Glutten-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            SwitchListTile(
              value: _lactoseFree,
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
              onChanged: (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
              subtitle: Text(
                "Only include lactose-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              title: Text(
                "Lactose-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            SwitchListTile(
              value: _vegeterian,
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
              onChanged: (newValue) {
                setState(() {
                  _vegeterian = newValue;
                });
              },
              subtitle: Text(
                "Only include Vegetarian meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            SwitchListTile(
              value: _vegan,
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
              onChanged: (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
              subtitle: Text(
                "Only include Vegan meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            )
          ],
        ),
      ),
    );
  }
}
