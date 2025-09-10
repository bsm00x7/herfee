import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
import 'package:herfee/features/screen/profile/widget/booking_buttom.dart';

import '../../../common_widgets/experience_card.dart';
import '../../../common_widgets/header_title.dart';
import '../../../common_widgets/info_card.dart';
import '../../../common_widgets/job_title.dart';
import '../../../common_widgets/rating_card.dart';
import '../../../common_widgets/verifier_account.dart';
import '../../../common_widgets/work_Card.dart';
import '../../../generated/l10n.dart';
import '../../../service/model/user_model.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel user;

  const ProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          s.ProfessionalDetails,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
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
              Icons.arrow_back_ios_rounded,
              color: theme.colorScheme.onSurface,
              size: 18,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          ContainerDecoration(
            theme: theme,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 120, 24, 32),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  theme.colorScheme.secondary.withValues(
                                    alpha: 0.3,
                                  ),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.2,
                                  ),
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
                                  backgroundColor:
                                      theme.colorScheme.surfaceContainer,
                                  backgroundImage: user.imageId.isNotEmpty
                                      ? NetworkImage(user.imageId)
                                      : null,
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
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

                              /// Verifier Account
                              VerifierIcon(
                                isVerifier: user.isActive,
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
                              title: 'Past Work',
                              icon: FontAwesomeIcons.folderOpen,
                            ),
                            const SizedBox(height: 16),
                            ...user.pastWork.map(
                              (job) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: WorkCard(theme: theme, job: job),
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: BookingButton(user: user,)),
        ],
      ),
    );
  }
}
