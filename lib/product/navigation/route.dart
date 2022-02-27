import 'package:auto_route/auto_route.dart';
import 'package:luggage_storage/view/authentication/auth_view.dart';
import 'package:luggage_storage/view/home/home_view.dart';
import 'package:luggage_storage/view/map/map_city_view.dart';
import 'package:luggage_storage/view/splash/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Route,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: AuthView),
    AutoRoute(page: HomeView),
    AutoRoute(page: MapView),
  ],
)
class $NavigationRoute {}
