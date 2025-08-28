import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: ()async{
          await Supabase.instance.client.auth.signOut();
        }, child: Text("SigOut")),
      ),
    );
  }
}
