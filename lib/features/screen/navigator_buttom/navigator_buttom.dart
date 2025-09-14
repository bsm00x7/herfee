import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../add_post/post_task_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class NavigatorButtom extends StatefulWidget {
  const NavigatorButtom({super.key});

  @override
  State<NavigatorButtom> createState() => _NavigatorButtomState();
}

class _NavigatorButtomState extends State<NavigatorButtom> {
  int _selectedIndex = 2;
  void _navScreen(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget screen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchScreen();
      case 2:
        return PostScreen();
      case 3:
        return MessageScreen();
      case 4:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
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
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.circlePlus),
            label: 'Post Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(child: screen(_selectedIndex)),
    );
  }
}
