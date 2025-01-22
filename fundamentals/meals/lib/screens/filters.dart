import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FiltersScreen>{

  var _glutenFree = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFree, 
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 32, right: 24),
            onChanged: (newValue){
              setState(() {
                _glutenFree = newValue;
              });
            },
            subtitle: Text("Only include gluten-free meals", style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface
          ),),
            title: Text("Glutten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface
          ),),
          
          )
        ],
      ),
    );
  }
}