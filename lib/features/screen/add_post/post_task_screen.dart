import 'dart:io';
import 'package:flutter/material.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
import 'package:herfee/core/utils/picker_image_gallery_camera/picker.dart';
import 'package:herfee/features/auth/data/data.dart';
import 'package:herfee/features/screen/add_post/controller/taskController.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/service/model/job_model.dart';

class PostScreen extends StatelessWidget {
  final JobModel? jobToEdit;
  const PostScreen({super.key, this.jobToEdit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final isEditing = jobToEdit != null;

    return ChangeNotifierProvider(
      create: (context) {
        final controller = TaskController();
        if (isEditing) {
          controller.loadJobForEditing(jobToEdit!);
        }
        return controller;
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            isEditing ? "Edit Job" : "Post Job",
            style: theme.textTheme.headlineLarge,
          ),
          surfaceTintColor: Colors.transparent,
          foregroundColor: theme.appBarTheme.foregroundColor,
          backgroundColor: theme.appBarTheme.backgroundColor,
          iconTheme: theme.appBarTheme.iconTheme,
          actionsIconTheme: theme.appBarTheme.actionsIconTheme,
          elevation: theme.appBarTheme.elevation,
          centerTitle: true,
        ),
        body: ContainerDecoration(
          theme: theme,
          child: Consumer<TaskController>(
            builder: (context, controller, child) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            // Title Field
                            TextFormField(
                              controller: controller.titleController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a job title';
                                }
                                if (value.trim().length < 3) {
                                  return 'Title must be at least 3 characters';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter Title of Job",
                                prefixIcon: Icon(Icons.work_outline),
                                hintMaxLines: 1,
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Description Field
                            TextFormField(
                              controller: controller.descriptionController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a job description';
                                }
                                if (value.trim().length < 10) {
                                  return 'Description must be at least 10 characters';
                                }
                                return null;
                              },
                              cursorErrorColor: Colors.red,
                              cursorColor: Colors.blueAccent,
                              maxLines: 5,
                              minLines: 2,
                              maxLength: 500,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                errorMaxLines: 5,
                                hintMaxLines: 5,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                hintText: "Enter Description of Job",
                                prefixIcon: Icon(Icons.description),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Image Section Title
                            Text(
                              "Add Photo of Job",
                              style: theme.textTheme.titleMedium,
                            ),

                            const SizedBox(height: 15),

                            // Image Picker Section
                            GestureDetector(
                              onTap: () =>
                                  _showImagePickerDialog(context, controller),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primaryContainer
                                      .withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Container(
                                  height: size.height * 0.4,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primaryContainer
                                        .withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color: theme.colorScheme.primary,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: _buildImageSection(
                                    controller,
                                    theme,
                                    isEditing,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Submit Button
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: controller.isLoading
                                    ? null
                                    : () async {
                                        bool success;
                                        if (isEditing) {
                                          final String? id =
                                              await SupaBaseData().jobId(
                                                job: jobToEdit!,
                                              );
                                          success = await controller
                                              .updateJobPost(context, id!);
                                        } else {
                                          success = await controller
                                              .createJobPost(context);
                                        }

                                        if (success && context.mounted) {
                                          context
                                              .pop(); // Go back to previous screen
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  elevation: 2,
                                  shadowColor: theme.colorScheme.shadow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: controller.isLoading
                                    ? SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                theme.colorScheme.onPrimary,
                                              ),
                                        ),
                                      )
                                    : Text(
                                        isEditing ? "Update Job" : "Post Job",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color:
                                                  theme.colorScheme.onPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(
    TaskController controller,
    ThemeData theme,
    bool isEditing,
  ) {
    // Show selected image if available
    if (controller.selectedImage != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.file(
              File(controller.selectedImage!.path),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => controller.setImage(null),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      );
    }

    // Show existing image if editing and no new image selected
    if (isEditing && jobToEdit?.imageJob != null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              jobToEdit!.imageJob!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder(theme, "Current Image");
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.8),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 20),
            ),
          ),
        ],
      );
    }

    // Show placeholder
    return _buildPlaceholder(theme, "Tap to add photo");
  }

  Widget _buildPlaceholder(ThemeData theme, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesome.images, size: 48, color: theme.colorScheme.primary),
        const SizedBox(height: 16),
        Text(
          text,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Choose from camera or gallery",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  void _showImagePickerDialog(BuildContext context, TaskController controller) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Select Image Source",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        PickerImageClasse().pickerFromCamera(
                          context: context,
                          callBackFunction: (image) async {
                            controller.setImage(image);
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 32,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Camera",
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        PickerImageClasse().pickerFromGallery(
                          context: context,
                          callBackFunction: (image) async {
                            controller.setImage(image);
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_library_rounded,
                              size: 32,
                              color: theme.colorScheme.secondary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Gallery",
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
