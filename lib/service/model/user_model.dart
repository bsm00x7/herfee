import 'package:herfee/service/model/job_model.dart';

class Experience {
  final String title;
  final String periode;

  Experience({required this.title, required this.periode});

  Map<String, dynamic> toMap() {
    return {'title': title, 'periode': periode};
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
  final String imageId;
  final String userName;
  final String jobe;
  final String rating;
  final String reviews;
  final String about;
  final List<JobModel> pastWork;
  final List<Experience> experience;
  final bool isActive;

  final bool verifer_account;
  final String role;

  UserModel({
    required this.id,
    required this.imageId,
    required this.userName,
    required this.jobe,
    required this.rating,
    required this.reviews,
    required this.about,
    List<JobModel>? pastWork,
    List<Experience>? experience,
    required this.isActive,
    this.verifer_account = false,
    required this.role,
  }) : pastWork = pastWork ?? [],
       experience = experience ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageId': imageId,
      'userName': userName,
      'jobe': jobe,
      'rating': rating,
      'reviews': reviews,
      'about': about,
      'pastWork': pastWork,
      'experience': experience,
      'isActive': isActive,
      'verifer_account': verifer_account,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    List<T> parseList<T>(
      dynamic listData,
      T Function(Map<String, dynamic>) fromMap,
    ) {
      if (listData is List) {
        return listData
            .map((item) => fromMap(item as Map<String, dynamic>))
            .toList();
      }
      return []; // Return empty list if data is null or not a list
    }

    return UserModel(
      id: map['id'] as String,
      imageId: map['imageId'] as String,
      userName: map['userName'] as String,
      jobe: map['jobe'] as String,
      rating: map['rating'] as String,
      reviews: map['reviews'] as String,
      about: map['about'] as String,
      pastWork: map.containsKey('pastWork') && map['pastWork'] != null
          ? (map['pastWork'] as List)
                .map((i) => JobModel.fromMap(i as Map<String, dynamic>))
                .toList()
          : [],
      experience: map.containsKey('experience') && map['experience'] != null
          ? (map['experience'] as List)
                .map((i) => Experience.fromMap(i as Map<String, dynamic>))
                .toList()
          : [],
      isActive: map['isActive'] as bool,
      verifer_account: map['verifer_account'] as bool,
      role: map['role'] as String,
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
    bool? isActive,
    bool? verifer_account,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      imageId: imageId ?? this.imageId,
      userName: userName ?? this.userName,
      jobe: jobe ?? this.jobe,
      rating: rating ?? this.rating,
      reviews: reviwes ?? this.reviews,
      about: about ?? this.about,
      pastWork: pastWork ?? this.pastWork,
      experience: experience ?? this.experience,
      isActive: isActive ?? this.isActive,
      verifer_account: verifer_account ?? this.verifer_account,
      role: role ?? this.role,
    );
  }
}
