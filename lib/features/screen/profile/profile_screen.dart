import 'package:flutter/material.dart';
import 'package:herfee/service/model/user_model.dart';
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

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileController(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              s.Profile,
              style: theme.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              FutureBuilder<UserModel>(
                future: Provider.of<ProfileController>(
                  context,
                  listen: false,
                ).getUser(),
                builder: (context, AsyncSnapshot<UserModel> snapshot) {
                  // Handle loading state
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // Handle error state
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error loading profile',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.error.toString(),
                            style: theme.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  // Handle success state
                  if (snapshot.hasData && snapshot.data != null) {
                    final user = snapshot.data!;
                    return Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile Image
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: user.imageId.isNotEmpty
                                    ? NetworkImage(user.imageId)
                                    : null,
                                child: user.imageId.isEmpty
                                    ? const Icon(Icons.person, size: 60)
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // User Name
                            Center(
                              child: Text(
                                user.userName,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Job Title
                            Center(
                              child: Text(
                                user.jobe, // Note: might want to rename to 'job'
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Rating and Reviews
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    user.rating,
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '(${user.reviwes} reviews)',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // About Section
                            if (user.about.isNotEmpty) ...[
                              Text(
                                'About',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                user.about,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                            ],

                            // Experience Section
                            if (user.experience.isNotEmpty) ...[
                              Text(
                                'Experience',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...user.experience.map((exp) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Card(
                                  child: ListTile(
                                    title: Text(exp.title),
                                    subtitle: Text(exp.periode),
                                    leading: const Icon(Icons.work),
                                  ),
                                ),
                              )),
                              const SizedBox(height: 16),
                            ],

                            // Past Work Section
                            if (user.pastWork.isNotEmpty) ...[
                              Text(
                                'Past Work',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...user.pastWork.map((job) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Card(
                                  child: ListTile(
                                    title: Text(job.title ?? 'Untitled Job'),
                                    subtitle: Text(job.title ?? ''),
                                    leading: const Icon(Icons.assignment),
                                  ),
                                ),
                              )),
                            ],
                          ],
                        ),
                      ),
                    );
                  }

                  // Handle case where data is null
                  return const Center(
                    child: Text('No user data available'),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}