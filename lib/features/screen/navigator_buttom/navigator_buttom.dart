import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorButtom extends StatelessWidget {
  const NavigatorButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: TextButton(onPressed:(){
          context.go('/home');
        } , child: Text("data")),
      ),
    );
  }
}
