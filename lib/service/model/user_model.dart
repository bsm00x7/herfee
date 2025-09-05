import 'package:herfee/service/model/job_model.dart';

class Experience {
  final String title;
  final String periode;

  Experience({required this.title, required this.periode});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'periode': periode,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      title: map['title'] as String? ?? '',
      periode: map['periode'] as String? ?? '',
    );
  }
}

class UserModel {
  final String id;
   final String? imageId;
  final String userName;
  final String jobe;
  final String rating;
  final String reviwes;
  final String about;
  final List<JobModel> pastWork;
  final List<Experience> experience;
  final bool isActive;

  UserModel({
    required this.id,
    this.imageId,
    required this.userName,
    required this.jobe,
    required this.rating,
    required this.reviwes,
    required this.about,
    List<JobModel>? pastWork,
    List<Experience>? experience,
    required this.isActive

  })  : pastWork = pastWork ?? [],
        experience = experience ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageId': imageId,
      'userName': userName,
      'jobe': jobe,
      'rating': rating,
      'reviwes': reviwes,
      'about': about,
      'pastWork': pastWork.map((job) => job.toMap()).toList(),
      'experience': experience.map((exp) => exp.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    // Convert pastWork safely
    List<JobModel> parsedPastWork = [];
    if (map['pastWork'] != null && map['pastWork'] is List) {
      parsedPastWork = List<JobModel>.from(
        (map['pastWork'] as List).map((x) => JobModel.fromMap(x)),
      );
    }

    // Convert experience safely
    List<Experience> parsedExperience = [];
    if (map['experience'] != null && map['experience'] is List) {
      parsedExperience = List<Experience>.from(
        (map['experience'] as List).map((x) => Experience.fromMap(x)),
      );
    }

    return UserModel(
      id: map['id'] as String? ?? '',
      imageId: map['imageId'] as String? ?? '',
      userName: map['userName'] as String? ?? '',
      jobe: map['jobe'] as String? ?? '',
      rating: map['rating'] as String? ?? '0',
      reviwes: map['reviwes'] as String? ?? '0',
      about: map['about'] as String? ?? '',
      pastWork: parsedPastWork,
      experience: parsedExperience,
      isActive: map["isActive"]
    );
  }

  UserModel copyWith({
    String? id,
    String? imageId,
    String? userName,
    String? jobe,
    String? rating,
    String? reviwes,
    String? about,
    List<JobModel>? pastWork,
    List<Experience>? experience,
    List<JobModel>? parsedPastWork,
    List<Experience>? parsedExperience,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      imageId: imageId ?? this.imageId,
      userName: userName ?? this.userName,
      jobe: jobe ?? this.jobe,
      rating: rating ?? this.rating,
      reviwes: reviwes ?? this.reviwes,
      about: about ?? this.about,
      pastWork: pastWork ?? this.pastWork,
      experience: experience ?? this.experience,
      isActive: isActive ?? this.isActive
    );
  }

}
