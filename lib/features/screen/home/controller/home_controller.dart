import 'package:flutter/cupertino.dart';
import 'package:herfee/service/job_model.dart';

class HomeController extends ChangeNotifier{




List<JobModel> job =[
  JobModel(imageSource: "assets/image/Plumbing.png", title: 'Plumbing'),
  JobModel(imageSource: "assets/image/Electrical.png", title: 'Electrical'),
  JobModel(imageSource: "assets/image/Cleaning.png", title: 'Cleaning'),
  JobModel(imageSource: "assets/image/HandyMan.png", title: 'HandyMan'),
  JobModel(imageSource: "assets/image/Painting.png", title: 'Painting'),
  JobModel(imageSource: "assets/image/Plumbing.png", title: 'Plumbing'),
];

}