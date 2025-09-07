import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/features/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:provider/provider.dart';

import '../../features/screen/chat/chat_screen.dart';
import '../../features/screen/forgot_password_screen/screen_otp.dart';
import '../../features/screen/home/home_screen.dart';
import '../../features/screen/navigator_buttom/navigator_buttom.dart';
import '../../features/screen/post_task_screen.dart';
import '../../features/screen/profile/profile_info.dart';
import '../../features/screen/profile/profile_screen.dart';
import '../../features/screen/search/search_screen.dart';
import '../../features/screen/setting/setting.dart';

import '../../features/screen/sign_up/signUp_screen.dart';
import '../../features/screen/signin/SignInPage.dart';
import '../../features/auth/domain/auth.dart';
import '../../service/model/user_model.dart';

GoRouter createRouter(BuildContext context) {
  final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  return GoRouter(
    initialLocation: '/',
    refreshListenable: authNotifier,
    redirect: (BuildContext context, GoRouterState state) {
      final bool isLoggedIn = authNotifier.isLoggedIn;
      final bool isGoingToLogin = state.matchedLocation == '/signin';
      final bool isGoingToSignup = state.matchedLocation == '/signup';
      final bool isGoingToForgotPassword = state.matchedLocation == '/forgot';

      if (!isLoggedIn &&
          !isGoingToLogin &&
          !isGoingToSignup &&
          !isGoingToForgotPassword) {
        debugPrint(
          "Redirect: Not logged in, not going to auth pages. Redirecting to /signin",
        );
        return '/signin';
      }

      if (isLoggedIn && (isGoingToLogin || isGoingToSignup)) {
        debugPrint(
          "Redirect: Logged in, going to login/signup. Redirecting to /",
        );
        return '/';
      }

      debugPrint("Redirect: No redirect needed for ${state.matchedLocation}");
      return null;
    },
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => NavigatorButtom()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/postTask',
        builder: (context, state) => const AddTaskScreen(),
      ),
      GoRoute(
        path: '/messages',
        builder: (context, state) => const MessageScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(path: '/settings', builder: (context, state) => const Setting()),
      // Assuming Setting is SettingsScreen
      GoRoute(
        path: '/profileInfo',
        builder: (context, state) {
          if (state.extra is UserModel) {
            final userModel = state.extra as UserModel;
            return ProfileInfo(user: userModel);
          }
          debugPrint(
            "Error: /profileInfo called without valid UserModel in extra. state.extra: ${state.extra}",
          );
          return Scaffold(
            body: Center(child: Text("Error: User data missing.")),
          ); // Fallback
        },
      ),

      // Auth Routes (accessible when not logged in, due to redirect logic)
      GoRoute(path: '/signin', builder: (context, state) => const SignInPage()),
      GoRoute(
        path: '/signup', // <<--- THE ROUTE FOR SIGNUP IS DEFINED HERE!
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/forgot', // Assuming ForgotPasswordPage is correct
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) =>
            const ScreenOtp(email: '', fullName: '', job: '', about: ''),
      ),
    ],
    errorBuilder: (context, state) {
      debugPrint(
        "GoRouter Error: No route defined for ${state.uri} from path ${state.path} (matched: ${state.matchedLocation})",
      );
      return Scaffold(
        appBar: AppBar(title: Text("Page Not Found")),
        body: Center(
          child: Text("Oops! The page at ${state.uri} was not found."),
        ),
      );
    },
  );
}
