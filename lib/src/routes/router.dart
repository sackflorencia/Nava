import 'package:go_router/go_router.dart';
import 'package:nava/src/screens/account.dart';
import 'package:nava/src/screens/add_goal.dart';
import 'package:nava/src/screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Account()),
    GoRoute(
      path: '/home',
      builder: (context, state) =>
          HomeScreen(email: state.extra as String),
    ),
    GoRoute(path: '/add_goal', builder: (context, state) => const AddGoal()),
  ],
);
