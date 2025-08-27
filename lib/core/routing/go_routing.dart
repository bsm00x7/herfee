import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/screen/chat/chat_screen.dart';
import '../../features/screen/home/home_screen.dart';
import '../../features/screen/navigator_buttom/navigator_buttom.dart';
import '../../features/screen/post_task_screen.dart';
import '../../features/screen/profile/profile_info.dart';
import '../../features/screen/profile/profile_screen.dart';
import '../../features/screen/search/search_screen.dart';
import '../../features/screen/setting/setting.dart';

import '../../features/screen/signin/SignInPage.dart';
import '../../service/auth/auth.dart';
import '../../service/model/user_model.dart';


GoRouter createRouter(BuildContext context) {
  final authNotifier = Provider.of<AuthNotifier>(context, listen: false);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isLoggedIn = authNotifier.isLoggedIn;
      final loggingIn = state.matchedLocation == '/signin';
      if (!isLoggedIn && !loggingIn) return '/signin';
      if (isLoggedIn && loggingIn) return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => NavigatorButtom()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
      GoRoute(path: '/postTask', builder: (context, state) => AddTaskScreen()),
      GoRoute(path: '/messages', builder: (context, state) => MessageScreen()),
      GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      GoRoute(path: '/settings', builder: (context, state) => Setting()),
      GoRoute(
        path: '/profileInfo',
        builder: (context, state) {
          final userModel = state.extra as UserModel;
          return ProfileInfo(userModel: userModel);
        },
      ),
      GoRoute(path: '/signin', builder: (context, state) =>  SignInPage()),
    ],
  );
}
