import 'package:go_router/go_router.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/screens/account.dart';
import 'package:nava/src/screens/choose_goal_template.dart';
import 'package:nava/src/screens/goal_view.dart';
import 'package:nava/src/screens/home_screen.dart';
import 'package:nava/src/screens/task_details.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Account()),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/choose_goal_template',
      builder: (context, state) =>
          ChooseGoalTemplate(goalTitle: state.extra as String),
    ),
    GoRoute(
      path: '/goal_view',
      builder: (context, state) => GoalView(goal: state.extra as Goal),
    ),
    GoRoute(
      path: '/task_details',
      builder: (context, state) => TaskDetails(task: state.extra as Task),
    ),
  ],
);
