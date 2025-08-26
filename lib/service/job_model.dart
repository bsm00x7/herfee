class JobModel {


  final String imageSource;
  final String title;
  JobModel({required this.imageSource , required this.title});

  Map<String, dynamic> toMap() {
    return {
      'imageSource': imageSource,
      'title': title,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      imageSource: map['imageSource'] as String,
      title: map['title'] as String,
    );
  }}