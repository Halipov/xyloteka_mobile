import 'package:auto_route/auto_route.dart';
import 'package:xyloteka/presentation/samples/samples_page.dart';
import 'package:xyloteka/presentation/sign_in/sign_in_page.dart';
import 'package:xyloteka/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SamplesPage),
  ],
)
class $AppRouter {}
