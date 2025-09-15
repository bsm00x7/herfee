import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:herfee/features/auth/data/data.dart';
import 'package:herfee/features/auth/data/storge.dart';
import 'package:herfee/service/model/job_model.dart';

class TaskController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setImage(XFile? image) {
    _selectedImage = image;
    notifyListeners();
  }

  void clearForm() {
    titleController.clear();
    descriptionController.clear();
    _selectedImage = null;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> createJobPost(BuildContext context) async {
    if (!validateForm()) {
      return false;
    }

    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an image for your job post'),
        ),
      );
      return false;
    }

    setLoading(true);

    try {
      final jobId = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload image first
      final imageUrl = await Storage().uploadJobImage(
        jobId: jobId,
        image: File(_selectedImage!.path),
      );

      if (imageUrl == null) {
        throw Exception('Failed to upload image');
      }

      // Create job object using your existing JobModel
      final job = JobModel(
        job_title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imageJob: imageUrl,
        id: jobId,
        userId: SupaBaseData().currentLoginUser,
        createdAt: DateTime.now(),
        isActive: true,
      );

      // Insert to database using existing method structure
      await SupaBaseData().insertJobPost(job: job);

      clearForm();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job posted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      return true;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating job post: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Load existing job for editing
  void loadJobForEditing(JobModel job) {
    titleController.text = job.job_title;
    descriptionController.text = job.description;
    // Note: We can't set the image from URL, but we could show it in preview
    notifyListeners();
  }

  Future<bool> updateJobPost(BuildContext context, String jobId) async {
    if (!validateForm()) {
      return false;
    }

    setLoading(true);

    try {
      String? imageUrl;

      // Upload new image if selected
      if (_selectedImage != null) {
        imageUrl = await Storage().uploadJobImage(
          jobId: jobId,
          image: File(_selectedImage!.path),
        );
        if (imageUrl == null) {
          throw Exception('Failed to upload image');
        }
      }

      // Create updated job object
      final updatedJob = JobModel(
        job_title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imageJob: imageUrl, // Will be null if no new image selected
        id: jobId,
      );

      // Update in database
      await SupaBaseData().updateJobPost(jobId: jobId, job: updatedJob);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }

      return true;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating job: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
