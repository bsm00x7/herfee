class JobModel {
  final String imageSource;
  final String title;
  final String description;
  JobModel({
    required this.imageSource,
    required this.title,
    this.description = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'imageSource': imageSource,
      'title': title,
      'description': description,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      imageSource: map['imageSource'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
    );
  }
}
