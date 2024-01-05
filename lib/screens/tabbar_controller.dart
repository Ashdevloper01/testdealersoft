import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:system_task_dealersoft/screens/tasks_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Comming Soon',
      ),
    ),
    Tasks(),
    Center(
      child: Text(
        'Comming Soon',
      ),
    ),
    Center(
      child: Text(
        'Comming Soon',
      ),
    ),
    Center(
      child: Text(
        'Comming Soon',
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: const Color(0xFFF8D349),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            label: "EWO",
            icon: Icon(MdiIcons.cubeOutline),
          ),
          BottomNavigationBarItem(
            label: "Tasks",
            icon: Icon(MdiIcons.wrench),
          ),
          // Add SizedBox to create space between the second and third items
          const BottomNavigationBarItem(
            label: "", // Empty label
            icon: SizedBox.shrink(), // Empty icon
          ),
          BottomNavigationBarItem(
            label: "Reports",
            icon: Icon(MdiIcons.poll),
          ),
          BottomNavigationBarItem(
            label: "Admin",
            icon: Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}
