import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
class NavigatorButtom extends StatefulWidget {
  const NavigatorButtom({super.key});

  @override
  State<NavigatorButtom> createState() => _NavigatorButtomState();
}

class _NavigatorButtomState extends State<NavigatorButtom> {
  @override
  int _selectedIndex = 0;
  void _navScreen(int index , BuildContext context){
    setState(() {
      _selectedIndex = index;
    });

  }
  Widget screen (int index ){
    switch(index){
      case 0:
        return HomeScreen();
      case 1:
        return SearchScreen();
      case 2:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (index) => _navScreen(index, context),
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search) , label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Settings'),
      ],

      ),
      body:SafeArea(child: screen(_selectedIndex)),
    );
  }
}
