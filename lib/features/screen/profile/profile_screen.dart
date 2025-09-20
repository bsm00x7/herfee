import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
import 'package:herfee/core/utils/loding/loding_indicator.dart';
import 'package:herfee/service/model/user_model.dart';
import '../../../common_widgets/experience_card.dart';
import '../../../common_widgets/header_title.dart';
import '../../../common_widgets/info_card.dart';
import '../../../common_widgets/job_title.dart';
import '../../../common_widgets/rating_card.dart';
import '../../../common_widgets/verifier_account.dart';
import '../../../common_widgets/work_Card.dart';
import '../../../generated/l10n.dart';
import 'controller/profileController.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProfileController();
    // Initialize controller after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider.value(
      value: _controller,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            s.Profile,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          centerTitle: true,
          actions: [
            Consumer<ProfileController>(
              builder: (context, controller, child) {
                return IconButton(
                  onPressed: controller.isLoading
                      ? null
                      : () async {
                          await controller.refreshUserData();
                        },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: controller.isLoading
                        ? theme.disabledColor
                        : theme.colorScheme.onSurface,
                  ),
                );
              },
            ),
          ],
        ),
        body: ContainerDecoration(
          theme: theme,
          child: Consumer<ProfileController>(
            builder: (context, controller, child) {
              // Loading State
              if (controller.isLoading && !controller.hasData) {
                return _buildLoadingState(theme);
              }

              // Error State
              if (controller.error != null && !controller.hasData) {
                return _buildErrorState(theme, controller);
              }

              // Success State
              if (controller.hasData && controller.userData != null) {
                return _buildSuccessState(context, theme, s, size, controller);
              }

              // No Data State
              return _buildNoDataState(theme);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading Profile...',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(ThemeData theme, ProfileController controller) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.error.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Error Loading Profile',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onErrorContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              controller.error ?? 'Please try again later',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onErrorContainer.withValues(
                  alpha: 0.8,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: controller.isLoading ? null : () => controller.retry(),
              icon: controller.isLoading
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(
                          theme.colorScheme.onError,
                        ),
                      ),
                    )
                  : const Icon(Icons.refresh_rounded),
              label: Text(controller.isLoading ? 'Retrying...' : 'Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: theme.colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoDataState(ThemeData theme) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.userSlash,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No Profile Data',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Profile information is not available',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessState(
    BuildContext context,
    ThemeData theme,
    dynamic s,
    Size size,
    ProfileController controller,
  ) {
    final user = controller.userData!;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 120, 24, 32),
            child: Column(
              children: [
                // Profile Image with Upload Indicator
                _buildProfileImage(context, theme, s, size, controller, user),
                const SizedBox(height: 24),

                // User Name with Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        user.userName,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    VerifierIcon(
                      isVerifier: user.verifer_account,
                      theme: theme,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Job Title
                JobTitle(theme: theme, jobName: user.jobe),
                const SizedBox(height: 8),

                // Rating Card
                RatingCard(
                  theme: theme,
                  rating: user.rating,
                  reviwes: user.reviews,
                ),
              ],
            ),
          ),
        ),

        // Content Sections
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // About Section
                if (user.about.isNotEmpty) ...[
                  HeaderTitle(
                    theme: theme,
                    title: 'About',
                    icon: FontAwesomeIcons.user,
                  ),
                  const SizedBox(height: 12),
                  InfoCard(
                    theme: theme,
                    child: Text(
                      user.about,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],

                // Experience Section
                if (user.experience.isNotEmpty) ...[
                  HeaderTitle(
                    theme: theme,
                    title: 'Experience',
                    icon: FontAwesomeIcons.briefcase,
                  ),
                  const SizedBox(height: 16),
                  ...user.experience.map(
                    (exp) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ExperienceCard(theme: theme, exp: exp),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],

                // Past Work Section
                if (user.pastWork.isNotEmpty) ...[
                  HeaderTitle(
                    theme: theme,
                    title: s.PostWork,
                    icon: FontAwesomeIcons.folderOpen,
                  ),
                  const SizedBox(height: 16),
                  ...user.pastWork.map(
                    (job) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildWorkCard(theme, job, context, controller),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],

                // Contact Section
                HeaderTitle(
                  theme: theme,
                  title: 'Contact',
                  icon: FontAwesomeIcons.addressCard,
                ),
                const SizedBox(height: 13),
                _buildContactCard(theme, size, context),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(
    BuildContext context,
    ThemeData theme,
    dynamic s,
    Size size,
    ProfileController controller,
    UserModel user,
  ) {
    return GestureDetector(
      onTap: controller.isImageUploading
          ? null
          : () {
              _showImagePicker(context, theme, s, size, controller);
            },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.3),
              theme.colorScheme.secondary.withValues(alpha: 0.3),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: theme.colorScheme.surfaceContainer,
              backgroundImage: _getProfileImageProvider(controller, user),
              child: _shouldShowPersonIcon(controller, user)
                  ? Icon(
                      Icons.person,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant,
                    )
                  : null,
            ),

            // Loading indicator for image upload
            if (controller.isImageUploading)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ),

            // Camera icon
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: controller.isImageUploading
                      ? theme.disabledColor
                      : theme.colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: theme.colorScheme.onPrimary,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkCard(
    ThemeData theme,
    dynamic job,
    BuildContext context,
    ProfileController controller,
  ) {
    return WorkCard(
      theme: theme,
      job: job,
      onTap: () => context.push('/post', extra: job),
      edit: true,
      onDelete: controller.isDeletingJob
          ? null
          : () async {
              // Show confirmation dialog
              final bool? confirmed = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Job'),
                    content: const Text(
                      'Are you sure you want to delete this job? This action cannot be undone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.error,
                        ),
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );

              if (confirmed == true) {
                await controller.deleteJob(job: job, context: context);
              }
            },
    );
  }

  Widget _buildContactCard(ThemeData theme, Size size, BuildContext context) {
    return InkWell(
      onTap: () => context.push("/contact"),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 60,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(FontAwesomeIcons.addressBook, color: Colors.blue),
              Text(
                "Click To Contact",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Icon(FontAwesomeIcons.arrowRight, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  void _showImagePicker(
    BuildContext context,
    ThemeData theme,
    dynamic s,
    Size size,
    ProfileController controller,
  ) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      elevation: 8,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
        minHeight: size.height * 0.2,
      ),
      context: context,
      builder: (modalContext) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerLowest,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 16, top: 8),
                  child: Text(
                    'Select Image Source',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),

                // Camera Option
                _buildImagePickerOption(
                  context: modalContext,
                  theme: theme,
                  icon: FontAwesomeIcons.camera,
                  title: s.Camera,
                  subtitle: 'Take a new photo',
                  onTap: () {
                    Navigator.pop(modalContext);
                    controller.pickerFromCamera(context);
                  },
                  isPrimary: true,
                ),

                const SizedBox(height: 8),

                // Gallery Option
                _buildImagePickerOption(
                  context: modalContext,
                  theme: theme,
                  icon: FontAwesomeIcons.images,
                  title: s.Gallery ?? 'Gallery',
                  subtitle: 'Choose from existing photos',
                  onTap: () {
                    Navigator.pop(modalContext);
                    controller.pickerFromGallery(context);
                  },
                  isPrimary: false,
                ),

                // Delete Image Option (only show if user has an image)
                if (controller.hasImage ||
                    (controller.userData?.imageId.isNotEmpty ?? false)) ...[
                  const SizedBox(height: 8),
                  _buildImagePickerOption(
                    context: modalContext,
                    theme: theme,
                    icon: FontAwesomeIcons.trash,
                    title: 'Remove Photo',
                    subtitle: 'Delete current profile picture',
                    onTap: () async {
                      Navigator.pop(modalContext);
                      // Show confirmation dialog
                      final bool? confirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Remove Profile Picture'),
                            content: const Text(
                              'Are you sure you want to remove your profile picture?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(true),
                                style: TextButton.styleFrom(
                                  foregroundColor: theme.colorScheme.error,
                                ),
                                child: const Text('Remove'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmed == true) {
                        await controller.deleteProfileImage(context);
                      }
                    },
                    isPrimary: false,
                    isDestructive: true,
                  ),
                ],

                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePickerOption({
    required BuildContext context,
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required bool isPrimary,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDestructive
                      ? theme.colorScheme.errorContainer
                      : isPrimary
                      ? theme.colorScheme.primaryContainer
                      : theme.colorScheme.secondaryContainer,
                ),
                child: FaIcon(
                  icon,
                  size: 20,
                  color: isDestructive
                      ? theme.colorScheme.onErrorContainer
                      : isPrimary
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isDestructive ? theme.colorScheme.error : null,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDestructive
                            ? theme.colorScheme.error.withValues(alpha: 0.7)
                            : theme.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to determine which image provider to use
  ImageProvider? _getProfileImageProvider(
    ProfileController controller,
    UserModel user,
  ) {
    // Priority 1: Controller's imageUrl (updated/uploaded image)
    if (controller.hasImage && controller.imageUrl != null) {
      return NetworkImage(controller.imageUrl!);
    }

    // Priority 2: User's imageId from database
    if (user.imageId.isNotEmpty) {
      return NetworkImage(user.imageId);
    }

    // No image available
    return null;
  }

  // Helper method to determine if person icon should be shown
  bool _shouldShowPersonIcon(ProfileController controller, UserModel user) {
    return !controller.hasImage && user.imageId.isEmpty;
  }
}
