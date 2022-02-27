// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../view/authentication/auth_view.dart' as _i2;
import '../../view/home/home_view.dart' as _i3;
import '../../view/map/map_city_view.dart' as _i4;
import '../../view/splash/splash_view.dart' as _i1;

class NavigationRoute extends _i5.RootStackRouter {
  NavigationRoute([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    AuthView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthView());
    },
    HomeView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeView());
    },
    MapView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MapView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashView.name, path: '/'),
        _i5.RouteConfig(AuthView.name, path: '/auth-view'),
        _i5.RouteConfig(HomeView.name, path: '/home-view'),
        _i5.RouteConfig(MapView.name, path: '/map-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashView extends _i5.PageRouteInfo<void> {
  const SplashView() : super(SplashView.name, path: '/');

  static const String name = 'SplashView';
}

/// generated route for
/// [_i2.AuthView]
class AuthView extends _i5.PageRouteInfo<void> {
  const AuthView() : super(AuthView.name, path: '/auth-view');

  static const String name = 'AuthView';
}

/// generated route for
/// [_i3.HomeView]
class HomeView extends _i5.PageRouteInfo<void> {
  const HomeView() : super(HomeView.name, path: '/home-view');

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.MapView]
class MapView extends _i5.PageRouteInfo<void> {
  const MapView() : super(MapView.name, path: '/map-view');

  static const String name = 'MapView';
}
