
import 'package:auto_route/auto_route.dart';
import 'package:luggage_storage/view/authentication/auth_view.dart';
import 'package:luggage_storage/view/home/home_view.dart';
import 'package:luggage_storage/view/map/map_view.dart';

@MaterialAutoRouter( routes: <AutoRoute>[        
    AutoRoute(page: AuthView, initial: true),        
    AutoRoute(page: HomeView),      
    AutoRoute(page: MapView),    
  ], )
class $NavigationRoute{}