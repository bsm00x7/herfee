import 'package:flutter/material.dart';
import 'package:herfee/features/auth/data/data.dart';
import 'package:herfee/service/model/user_model.dart';

import '../../../common_widgets/container_message.dart';
import '../../../common_widgets/verifier_account.dart';
import '../../../generated/l10n.dart';
import '../../../service/model/message_model.dart';
import '../profile/profile_info.dart';
import 'controller/controller_contact.dart';
import 'package:provider/provider.dart';

class ContactUser extends StatelessWidget {
  final UserModel user;

  const ContactUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ControllerContact(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: user.isActive
                            ? LinearGradient(
                                colors: [
                                  Colors.green.shade400,
                                  Colors.green.shade600,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                        border: !user.isActive
                            ? Border.all(
                                color: theme.dividerColor.withValues(
                                  alpha: 0.3,
                                ),
                                width: 2,
                              )
                            : null,
                      ),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: theme.colorScheme.surface,
                        backgroundImage: NetworkImage(user.imageId),
                        onBackgroundImageError: (exception, stackTrace) {},
                        child: user.imageId.isEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      theme.colorScheme.primary.withValues(
                                        alpha: 0.7,
                                      ),
                                      theme.colorScheme.primary,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: theme.colorScheme.onPrimary,
                                  size: 28,
                                ),
                              )
                            : null,
                      ),
                    ),
                    // Online status indicator
                    if (user.isActive)
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade500,
                            border: Border.all(
                              color:
                                  theme.appBarTheme.backgroundColor ??
                                  theme.scaffoldBackgroundColor,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withValues(alpha: 0.4),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),

                // User info with enhanced styling
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              user.userName,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.2,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          VerifierIcon(
                            theme: theme,
                            isVerifier: user.verifer_account,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: user.isActive
                              ? Colors.green.withValues(alpha: 0.15)
                              : theme.colorScheme.outline.withValues(
                                  alpha: 0.1,
                                ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: user.isActive
                                ? Colors.green.withValues(alpha: 0.3)
                                : theme.colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: user.isActive
                                    ? Colors.green.shade600
                                    : theme.colorScheme.outline.withValues(
                                        alpha: 0.6,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              user.isActive ? s.Online : s.Offline,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: user.isActive
                                    ? Colors.green.shade700
                                    : theme.colorScheme.outline,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          surfaceTintColor: Colors.transparent,
          actionsIconTheme: theme.appBarTheme.iconTheme,
          iconTheme: theme.appBarTheme.iconTheme,
          backgroundColor: theme.appBarTheme.backgroundColor,
          foregroundColor: theme.appBarTheme.foregroundColor,

          // Enhanced action buttons
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "view_profile") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileInfo(user: user),
                      ),
                    );
                  } else if (value == "block_user") {
                    _showBlockUserDialog(context, theme, s);
                  }
                },
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.2),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'view_profile',
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('View Profile'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'block_user',
                    child: Row(
                      children: [
                        Icon(
                          Icons.block_rounded,
                          size: 20,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Block User',
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: isDarkMode
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.scaffoldBackgroundColor,
                      theme.scaffoldBackgroundColor.withValues(alpha: 0.95),
                    ],
                  )
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.surface,
                      theme.colorScheme.surface.withValues(alpha: 0.8),
                    ],
                  ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Chat messages area
              Expanded(
                child: Consumer<ControllerContact>(
                  builder: (context, provider, child) {
                    return StreamBuilder<List<MessageModel>>(
                      stream: SupaBaseData().messageStream(
                        currentUserId: provider.currentLoginUserId,
                        otherUserId: user.id,
                      ),
                      builder:
                          (
                            context,
                            AsyncSnapshot<List<MessageModel>> snapshot,
                          ) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 48,
                                      color: theme.colorScheme.error,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Error loading messages',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${snapshot.error}',
                                      style: theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }

                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat_bubble_outline,
                                      size: 48,
                                      color: theme.colorScheme.outline
                                          .withValues(alpha: 0.5),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No messages yet',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.outline,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Start a conversation with ${user.userName}',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme.colorScheme.outline
                                                .withValues(alpha: 0.7),
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            final messages = snapshot.data!;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ListView.separated(
                                reverse: true, // Show latest messages at bottom
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final message = messages[index];
                                  final isFromCurrentUser =
                                      message.sendId ==
                                      provider.currentLoginUserId;
                                  return ContainerMessage(
                                    alignment: isFromCurrentUser
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    color: isFromCurrentUser
                                        ? theme.colorScheme.primary
                                        : theme
                                              .colorScheme
                                              .surfaceContainerHighest,
                                    size: size,
                                    message: message.content,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return const SizedBox(height: 8);
                                    },
                              ),
                            );
                          },
                    );
                  },
                ),
              ),

              // Enhanced message input area
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Consumer<ControllerContact>(
                    builder: (context, provider, child) {
                      return Row(
                        children: [
                          // Message input field
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: theme.colorScheme.outline.withValues(
                                    alpha: 0.2,
                                  ),
                                  width: 1.5,
                                ),
                              ),
                              child: TextField(
                                controller: provider.messageController,
                                enabled: !provider.isLoading,
                                maxLines: null,
                                textInputAction: TextInputAction.send,
                                onSubmitted: (value) {
                                  if (value.trim().isNotEmpty) {
                                    provider.sendMessage(recvId: user.id);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  hintStyle: TextStyle(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Send button
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary,
                                  theme.colorScheme.primary.withValues(
                                    alpha: 0.8,
                                  ),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              onPressed: provider.isLoading
                                  ? null
                                  : () {
                                      provider.sendMessage(recvId: user.id);
                                    },
                              icon: provider.isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: theme.colorScheme.onPrimary,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Icon(
                                      Icons.send_rounded,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBlockUserDialog(BuildContext context, ThemeData theme, dynamic s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Block User'),
          content: Text('Are you sure you want to block ${user.userName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement block user functionality here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${user.userName} has been blocked')),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
              child: const Text('Block'),
            ),
          ],
        );
      },
    );
  }
}
