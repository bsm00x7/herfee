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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          userModel.imageNetworkPath,
                        ),
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
                            "( ${userModel.reviwes} reviews)",
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
                    style: theme.textTheme.headlineMedium!.copyWith(fontSize: 18)
                  ),
                ),
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


              ],
            ),
          ),
        ),
      ),
    );
  }
}
