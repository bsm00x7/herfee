import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [InkWell( onTap: (){
          AdaptiveTheme.of(context).toggleThemeMode();
        } ,child: Icon(Icons.theater_comedy),)],
        
      ),
    );
  }
}
