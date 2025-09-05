import 'package:flutter/cupertino.dart';

import '../../../../service/model/job_model.dart';
import '../../../../service/model/user_model.dart';

class HomeController extends ChangeNotifier {
  List<JobModel> job = [
    JobModel(imageJob: "assets/image/Plumbing.png", jobTitle: 'Plumbing'),
    JobModel(imageJob: "assets/image/Electrical.png", jobTitle: 'Electrical'),
    JobModel(imageJob: "assets/image/Cleaning.png", jobTitle: 'Cleaning'),
    JobModel(imageJob: "assets/image/HandyMan.png", jobTitle: 'HandyMan'),
    JobModel(imageJob: "assets/image/Painting.png", jobTitle: 'Painting'),
    JobModel(imageJob: "assets/image/Plumbing.png", jobTitle: 'Plumbing'),
  ];
  Future<UserModel> goToProfile(String userId) async {
    return UserModel(
      id: 'fdssfsdfdsfeef 56d4f6d4f461dfdf',
      imageId: "",
      userName: "userName",
      jobe: "jobe",
      rating: "4.7",
      reviwes: "172",
      about: "Ethan is a highly skilled plumber with over 10 years of experience in the industry. He specializes in residential plumbing and is known for his attention to detail and excellent customer service.",
      pastWork: [JobModel(imageJob: "imageSource", jobTitle: "title")],
      experience: [Experience(title: 'title', periode: 'periode')], isActive: true,
    );
  }
}
