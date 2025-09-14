import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:herfee/common_widgets/container_decoration.dart';
import 'package:icons_plus/icons_plus.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Post Job", style: theme.textTheme.headlineLarge),
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hint: Text("Enter Title of Job"),
                              prefixIcon: Icon(Icons.post_add),
                              hintMaxLines: 1,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            cursorErrorColor: Colors.red,
                            cursorColor: Colors.blueAccent,
                            maxLines: 5,
                            minLines: 2,
                            maxLength: 500,
                            textAlign: TextAlign.left,

                            decoration: InputDecoration(
                              errorMaxLines: 5,
                              hintMaxLines: 5,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              hint: Text("Enter Description of Job"),
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Photo of Job",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            radius: Radius.circular(18),
                            dashPattern: [10, 10],
                            strokeWidth: 1.7,
                            padding: EdgeInsets.all(20),
                          ),
                          child: SizedBox(
                            height: size.height * 0.4,
                            width: size.width,
                            child: Center(child: Icon(FontAwesome.images)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
