import 'package:auto_route/auto_route.dart';
import 'package:agrosell/features/app/app_navigator.dart';
import 'package:agrosell/features/app/app_wrapper.dart';
import 'package:agrosell/features/auth/login/presentation/login_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: AppWrapper,
      initial: true,
      children: [
        AutoRoute(
          path: 'login',
          page: LoginScreen,
        ),
        AutoRoute(
          path: 'home',
          page: AppNavigator,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
