import 'package:flutter/cupertino.dart';

import '../../../../service/model/job_model.dart';
import '../../../../service/model/user_model.dart';

class HomeController extends ChangeNotifier {
  List<JobModel> job = [
    JobModel(imageSource: "assets/image/Plumbing.png", title: 'Plumbing'),
    JobModel(imageSource: "assets/image/Electrical.png", title: 'Electrical'),
    JobModel(imageSource: "assets/image/Cleaning.png", title: 'Cleaning'),
    JobModel(imageSource: "assets/image/HandyMan.png", title: 'HandyMan'),
    JobModel(imageSource: "assets/image/Painting.png", title: 'Painting'),
    JobModel(imageSource: "assets/image/Plumbing.png", title: 'Plumbing'),
  ];
  Future<UserModel> goToProfile(String userId) async {
    return UserModel(
      id: 'fdssfsdfdsfeef 56d4f6d4f461dfdf',
      imageId: "imageNetworkPath",
      userName: "userName",
      jobe: "jobe",
      rating: "4.7",
      reviwes: "172",
      about: "Ethan is a highly skilled plumber with over 10 years of experience in the industry. He specializes in residential plumbing and is known for his attention to detail and excellent customer service.",
      pastWork: [JobModel(imageSource: "imageSource", title: "title")],
      experience: [Experience(title: 'title', periode: 'periode')],
    );
  }
}
