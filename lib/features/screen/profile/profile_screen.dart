import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileController(),
      builder: (context, child) {
        return Scaffold(
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
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: theme.colorScheme.onSurface,
                    size: 20,
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: ContainerDecoration(
            theme: theme,
            child: FutureBuilder<UserModel>(
              future: Provider.of<ProfileController>(
                context,
                listen: false,
              ).getUser(),
              builder: (context, AsyncSnapshot<UserModel> snapshot) {
                // Enhanced Loading State
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Enhanced Error State
                if (snapshot.hasError) {
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
                              color: theme.colorScheme.error.withValues(
                                alpha: 0.1,
                              ),
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
                            'Please try again later',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onErrorContainer
                                  .withValues(alpha: 0.8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () => setState(() {}),
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Retry'),
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

                // Enhanced Success State
                if (snapshot.hasData && snapshot.data != null) {
                  final user = snapshot.data!;

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(24, 120, 24, 32),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    _showImagePicker(context, theme, s, size),
                                child: Consumer<ProfileController>(
                                  builder: (context, provider, child) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            theme.colorScheme.primary
                                                .withValues(alpha: 0.3),
                                            theme.colorScheme.secondary
                                                .withValues(alpha: 0.3),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: theme.colorScheme.primary
                                                .withValues(alpha: 0.2),
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
                                            backgroundColor: theme
                                                .colorScheme
                                                .surfaceContainer,
                                            backgroundImage:
                                                !provider.haveImage &&
                                                    user.imageId.isNotEmpty
                                                ? NetworkImage(user.imageId)
                                                : null,
                                            child:
                                                !provider.haveImage &&
                                                    user.imageId.isEmpty
                                                ? Icon(
                                                    Icons.person,
                                                    size: 64,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  )
                                                : null,
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color:
                                                    theme.colorScheme.primary,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      theme.colorScheme.surface,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 24),

                              // User Name with Badge
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      user.userName,
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: theme.colorScheme.onSurface,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Verifier Account
                                  VerifierIcon(
                                    isVerifier: user.verifer_account,
                                    theme: theme,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Job Title with Enhanced Styling
                              JobTitle(theme: theme, jobName: user.jobe),
                              const SizedBox(height: 8),

                              JobTitle(theme: theme, jobName: user.role),
                              const SizedBox(height: 20),

                              // Enhanced Rating Card
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
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.8),
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
                                    child: ExperienceCard(
                                      theme: theme,
                                      exp: exp,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],

                              // Past Work Section
                              if (user.pastWork.isNotEmpty) ...[
                                HeaderTitle(
                                  theme: theme,
                                  title: 'POst Work',
                                  icon: FontAwesomeIcons.folderOpen,
                                ),
                                const SizedBox(height: 16),
                                ...user.pastWork.map(
                                  (job) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Consumer<ProfileController>(
                                      builder: (context, provider, child) {
                                        return WorkCard(
                                          theme: theme,
                                          job: job,
                                          onTap:
                                              () => // Navigate to edit existing post
                                              context.push(
                                                '/post',
                                                extra: job,
                                              ),
                                          edit: true,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],

                              // Add bottom padding for last item
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }

                // No Data State
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
              },
            ),
          ),
        );
      },
    );
  }

  void _showImagePicker(
    BuildContext context,
    ThemeData theme,
    dynamic s,
    Size size,
  ) {
    // Get the provider instance before showing the modal to avoid context issues
    final profileController = Provider.of<ProfileController>(
      context,
      listen: false,
    );

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
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      Navigator.pop(modalContext);
                      // Use the provider instance we got before showing the modal
                      try {
                        profileController.pickerFromCamera(
                          context: context,
                          haveImage: profileController.haveImage,
                        );
                      } catch (e) {
                        // Handle error if needed
                        debugPrint('Error picking image from camera: $e');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error accessing camera: $e'),
                              backgroundColor: theme.colorScheme.error,
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primaryContainer,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.camera,
                              size: 20,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.Camera,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Take a new photo',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Gallery Option
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      Navigator.pop(modalContext);
                      // Add gallery picker functionality using the same profileController instance
                      try {
                        profileController.pickerFromGallery(
                          context: context,
                          haveImage: profileController.haveImage,
                        );
                      } catch (e) {
                        debugPrint('Error picking image from gallery: $e');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error accessing gallery: $e'),
                              backgroundColor: theme.colorScheme.error,
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.secondaryContainer,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.images,
                              size: 20,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.Gallery ?? 'Gallery',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Choose from existing photos',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
