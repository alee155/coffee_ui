import 'package:coffee/prac/CoffeeProfile.dart';
import 'package:coffee/prac/fav.dart';
import 'package:coffee/prac/practic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeNav extends StatefulWidget {
  const CoffeeNav({super.key});

  @override
  _CoffeeNavState createState() => _CoffeeNavState();
}

class _CoffeeNavState extends State<CoffeeNav> {
  int _selectedIndex = 0;

  final List<String> _iconPaths = [
    'assets/homecoff.svg', // Home icon
    'assets/favcoffee.svg', // Favorite icon
    'assets/me.svg', // Profile icon
  ];

  // List of screens for each index
  final List<Widget> _screens = [
    const TimsScreen(),
    const FavScreen(),
    const CoffeeProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to change icon color based on selected state
  Color _getIconColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _iconPaths[0],
              width: 30,
              height: 30,
              color: _getIconColor(0), // Set color based on selected index
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _iconPaths[1],
              width: 30,
              height: 30,
              color: _getIconColor(1), // Set color based on selected index
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _iconPaths[2],
              width: 30,
              height: 30,
              color: _getIconColor(2), // Set color based on selected index
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold, // Customize font weight for selected
          fontSize: 15, // Customize font size for selected
          color: Colors.white, // Color for selected label
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal, // Customize font weight for unselected
          fontSize: 14, // Customize font size for unselected
          color: Colors.grey, // Color for unselected label
        ),
      ),
    );
  }
}
