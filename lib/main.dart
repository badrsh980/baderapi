import 'package:api/screen/ObjectFormPage.dart';
import 'package:api/screen/Objectlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NavigationPage(),
  ));
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0; // Index of the currently selected page
  final List<Widget> _pages = [ObjectList(), ObjectFormPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Object List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Object',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
