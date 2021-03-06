import 'package:auto_route/auto_route.dart';
import 'package:luggage_storage/view/authentication/auth_view.dart';
import 'package:luggage_storage/view/bookView/book_succes_view.dart';
import 'package:luggage_storage/view/home/home_view.dart';
import 'package:luggage_storage/view/map/map_city_view.dart';
import 'package:luggage_storage/view/map/map_location_view.dart';
import 'package:luggage_storage/view/splash/splash_view.dart';
import 'package:luggage_storage/view/storageView/storage_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Route,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: AuthView),
    AutoRoute(page: HomeView),
    AutoRoute(page: MapCityView),
    AutoRoute(page: MapLocationView),
    AutoRoute(page: StorageDetailView),
    AutoRoute(page: BookSuccesView),
  ],
)
class $NavigationRoute {}
