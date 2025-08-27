import 'package:herfee/service/model/job_model.dart';

class Experience {
  final String title;
  final String periode;
  Experience({required this.title , required this.periode});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'periode': this.periode,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      title: map['title'] as String,
      periode: map['periode'] as String,
    );
  }}

class UserModel {
  final String id;
  final String imageId;
  final String userName;
  final String jobe;
  final String rating;

  final String reviwes;
  final String about;
  final List<JobModel> pastWork;
  final List<Experience> experience;
  UserModel({required this.id ,required this.imageId , required this.userName , required this.jobe , required this.rating , required this.reviwes , required this.about , required this.pastWork , required this.experience});
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'imageId': this.imageId,
      'userName': this.userName,
      'jobe': this.jobe,
      'rating': this.rating,
      'reviwes': this.reviwes,
      'about': this.about,
      'pastWork': this.pastWork,
      'experience': this.experience,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      imageId: map['imageId'] as String,
      userName: map['userName'] as String,
      jobe: map['jobe'] as String,
      rating: map['rating'] as String,
      reviwes: map['reviwes'] as String,
      about: map['about'] as String,
      pastWork: map['pastWork'] as List<JobModel>,
      experience: map['experience'] as List<Experience>,
    );
  }

}
