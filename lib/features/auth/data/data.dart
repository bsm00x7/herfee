
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../service/model/user_model.dart';
class SupaBaseData{
   final _instance = Supabase.instance.client;


    Future <UserModel> user()async{
     final currentLoginUser = Supabase.instance.client.auth.currentUser!.id;
     final response = await _instance.from('users').select().eq('id', currentLoginUser).single();
     return UserModel.fromMap(response);


   }

}