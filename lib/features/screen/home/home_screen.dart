import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import 'controller/home_controller.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),
      child: Scaffold(
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
        body: Column(
          children: [
            SizedBox(height: 20),
            SearchBar(hintText: s.SearchForServices),
            SizedBox(height: 20),
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
            SizedBox(height: 12),
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: Consumer<HomeController>(
                builder: (context, provider, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: provider.job.length,
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
                                  job.imageSource,
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
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  job.title.capitalize(),
                                  style:theme.textTheme.titleMedium,
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
            SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "s.FeaturedProfessionals",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
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
