class JobModel {
  final String job_title;
  final String description;
  final String? imageJob;
  final String? id;
  final String? userId;
  final DateTime? createdAt;
  final bool? isActive;

  JobModel({
    required this.job_title,
    this.description = '',
    this.imageJob,
    this.id,
    this.userId,
    this.createdAt,
    this.isActive = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': job_title,
      'description': description,
      'imageJob': imageJob,
      'id': id,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'is_active': isActive,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      job_title: map['title'] as String? ?? map['job_title'] as String,
      description: map['description'] as String? ?? '',
      imageJob: map['imageJob'] as String?,
      id: map['id'] as String?,
      userId: map['user_id'] as String?,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      isActive: map['is_active'] as bool? ?? true,
    );
  }

  JobModel copyWith({
    String? job_title,
    String? description,
    String? imageJob,
    String? id,
    String? userId,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return JobModel(
      job_title: job_title ?? this.job_title,
      description: description ?? this.description,
      imageJob: imageJob ?? this.imageJob,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
}
