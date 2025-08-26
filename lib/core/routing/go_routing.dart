import 'package:go_router/go_router.dart';
import 'package:herfee/features/screen/search/search_screen.dart';
import 'package:herfee/features/screen/setting/setting.dart';
import '../../features/screen/chat/chat_screen.dart';
import '../../features/screen/home/home_screen.dart';
import '../../features/screen/navigator_buttom/navigator_buttom.dart';
import '../../features/screen/post_task_screen.dart';
import '../../features/screen/profile/profile_info.dart';
import '../../features/screen/profile/profile_screen.dart';
import '../../service/model/user_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => NavigatorButtom()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/search', builder: (context, state) => SearchScreen()),
    GoRoute(path: '/postTask', builder: (context, state) => AddTaskScreen()),
    GoRoute(path: '/messages', builder: (context, state) => MessageScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(path: '/settings', builder: (context, state) => Setting()),
    GoRoute(path: '/profileInfo', builder: (context, state){
      final userModel = state.extra as UserModel;
      return ProfileInfo(userModel: userModel);
    }),
  ],
);
