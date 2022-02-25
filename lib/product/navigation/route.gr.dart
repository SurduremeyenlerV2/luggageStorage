// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../view/authentication/auth_view.dart' as _i1;
import '../../view/home/home_view.dart' as _i2;
import '../../view/map/map_view.dart' as _i3;

class NavigationRoute extends _i4.RootStackRouter {
  NavigationRoute([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthView());
    },
    HomeViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    MapViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MapView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(AuthViewRoute.name, path: '/'),
        _i4.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i4.RouteConfig(MapViewRoute.name, path: '/map-view')
      ];
}

/// generated route for
/// [_i1.AuthView]
class AuthViewRoute extends _i4.PageRouteInfo<void> {
  const AuthViewRoute() : super(AuthViewRoute.name, path: '/');

  static const String name = 'AuthViewRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i4.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i3.MapView]
class MapViewRoute extends _i4.PageRouteInfo<void> {
  const MapViewRoute() : super(MapViewRoute.name, path: '/map-view');

  static const String name = 'MapViewRoute';
}
