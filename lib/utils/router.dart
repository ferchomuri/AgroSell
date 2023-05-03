import 'package:agrosell/features/app/app_navigator.dart';
import 'package:agrosell/features/app/app_wrapper.dart';
import 'package:agrosell/features/auth/login/presentation/login_screen.dart';
import 'package:agrosell/features/features/widgets/components/add_name.dart';
import 'package:agrosell/features/features/widgets/components/edit_name.dart';
import 'package:auto_route/auto_route.dart';

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
        AutoRoute(
          path: 'editName/:id/:name',
          page: EditNamePage,
        ),
        AutoRoute(
          path: 'addName',
          page: AddNamePage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
