import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/job_model.dart';

class SupaBase {
  final supabaseClient = Supabase.instance.client;



  Future<List<JobModel>> fetchAllJobs() async {
    try {
      final response = await supabaseClient.from('job').select();

      final jobs = response
          .map((item) {
        return JobModel.fromMap(item);
      })
          .whereType<JobModel>()
          .toList();
      return jobs;
        } catch (e, stackTrace) {
      debugPrint('Error fetching jobs: $e');
      debugPrint(stackTrace.toString());

      throw Exception('Failed to load jobs: $e');
    }
  }


}