import 'package:go_router/go_router.dart';

import '../../features/screen/home/home_screen.dart';
import '../../features/screen/navigator_buttom/navigator_buttom.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => NavigatorButtom()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
  ],
);
