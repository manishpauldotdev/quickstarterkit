import 'package:go_router/go_router.dart';

enum AppRoute { screenNames }

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    // EXAMPLE OF DEFINING A ROUTE
    // GoRoute(
    //   path: '/',
    //   name: AppRoute.signin.name,
    //   pageBuilder: (context, state) {
    //     return MaterialPage(
    //       child: SigninPage(),
    //     );
    //   },
    // ),
  ],
);
