import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/service/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(s.homeScreenTitle, style: theme.textTheme.headlineLarge),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.gear),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SearchBar(
                  hintText: s.SearchForServices,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: theme.colorScheme.primary,
                      size: 18,
                    ),
                  ),
                  trailing: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.sliders,
                          color: theme.colorScheme.primary,
                          size: 16,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  s.PopularServices,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: size.height * 0.8,
                width: size.width,
                child: Consumer<HomeController>(
                  builder: (context, provider, child) {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: min(6, provider.job.length),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        final job = provider.job[index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.asset(
                                    job.imageJob!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey[600],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    job.jobTitle.capitalize(),
                                    style: theme.textTheme.titleMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  s.featuredProfessionals,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Consumer<HomeController>(
                builder: (context, provider, child) {
                  return SizedBox(
                    height: size.height * 0.40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:()async{
                           final UserModel user = await provider.goToProfile("userid");
                           context.push('/profileInfo', extra: user);
                          },
                          child: Container(

                            width: size.width *0.40,
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: Stack(
                                       children: [
                                         Image.asset(
                                         'assets/image/Cleaning.png',
                                         fit: BoxFit.fill,
                                         errorBuilder: (context, error, stackTrace) {
                                           return Container(
                                             color: Colors.grey[300],
                                             child: Icon(
                                               Icons.image_not_supported,
                                               color: Colors.grey[600],
                                             ),
                                           );
                                         },
                                       ),
                                         Positioned(
                                           top: 12,
                                           left: 12,
                                           child: Container(
                                             width: 13,
                                             height: 13,
                                             decoration: BoxDecoration(
                                               color: Colors.green,
                                               shape: BoxShape.circle,
                                               border: Border.all(
                                                 color: Colors.white,
                                                 width: 1,
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "Sarah Johnson",
                                          style: theme.textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "House Cleaning Expert",
                                          style: theme.textTheme.bodyMedium?.copyWith(
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.star,
                                              size: 14,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '4.9',
                                              style: theme.textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              '230 reviews',
                                              style: theme.textTheme.bodySmall?.copyWith(
                                                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10,);
                    },),
                  );
                },
              ),
              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this; // Handle empty strings
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
