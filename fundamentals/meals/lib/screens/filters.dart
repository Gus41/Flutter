import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[FilterEnum.glutenFree]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.glutenFree, newValue);
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
            value: activeFilters[FilterEnum.lactoseFree]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(FilterEnum.lactoseFree, newValue);
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
            value: activeFilters[FilterEnum.vegetarian]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).setFilter(FilterEnum.vegetarian, newValue);
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
            value: activeFilters[FilterEnum.vegan]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).setFilter(FilterEnum.vegan, newValue);
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
    );
  }
}
