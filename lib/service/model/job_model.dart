class JobModel {

  final String jobTitle;
  final String description;
  final String? imageJob;
  JobModel({

     required this.jobTitle,
    this.description = '',  this.imageJob,

  });

  Map<String, dynamic> toMap() {
    return {

      'title': jobTitle,
      'description': description,
      'imageSource': imageJob,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(

      jobTitle: map['title'] as String,
      description: map['description'] as String? ?? '',
      imageJob: map['imageJob'] as String?,
    );
  }
}
