import 'package:flutter/material.dart';
import 'package:first/screens/screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Tabs();
  }
}

class _Tabs extends State<Tabs> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colors[_selectedIndex],
        child: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Screen ${_selectedIndex+1}', style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return Screen();
              }));
            }, child:Text("Push navigation"))
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '3',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
