import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../service/model/user_model.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel userModel;

  const ProfileInfo({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.ProfessionalDetails,
          style: theme.textTheme.headlineLarge!.copyWith(fontSize: 24),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header Section
              SizedBox(
                height: size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          (
                              userModel.imageId.isNotEmpty)
                          ? NetworkImage(userModel.imageId)
                          : const AssetImage('assets/image/avatar.png')
                                as ImageProvider,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userModel.userName,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userModel.rating,
                          style: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 20,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "(${userModel.reviwes} reviews)",
                          style: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 20,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // About Section
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  s.About,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  userModel.about,
                  style: theme.textTheme.headlineMedium!.copyWith(fontSize: 18),
                ),
              ),

              // Past Work Section
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  s.PostWork,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * 0.2,
                child: userModel.pastWork.isEmpty
                    ? Center(
                        child: Text(
                          "No past work to display",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: userModel.pastWork.length,
                        itemBuilder: (context, index) {
                          final job = userModel.pastWork[index];
                          return Container(
                            height: size.height * 0.1,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: job.imageJob !=null
                                          ? Image.network(
                                              job.imageJob!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Container(
                                                      color: Colors.grey[300],
                                                      child: Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        color: Colors.grey[600],
                                                      ),
                                                    );
                                                  },
                                            )
                                          : Image.asset(
                                              "assets/image/Depth 5, Frame 0.png",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Container(
                                                      color: Colors.grey[300],
                                                      child: Icon(
                                                        Icons
                                                            .image_not_supported,
                                                        color: Colors.grey[600],
                                                      ),
                                                    );
                                                  },
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      job.jobTitle,
                                      style: theme.textTheme.titleLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 10);
                        },
                      ),
              ),

              // Experience Section
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Experience",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              userModel.experience.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "No experience to display",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: userModel.experience
                          .map(
                            (exp) => Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exp.title,
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exp.periode,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
