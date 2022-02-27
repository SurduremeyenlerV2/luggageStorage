// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../view/authentication/auth_view.dart' as _i2;
import '../../view/bookView/book_succes_view.dart' as _i7;
import '../../view/home/home_view.dart' as _i3;
import '../../view/map/map_city_view.dart' as _i4;
import '../../view/map/map_location_view.dart' as _i5;
import '../../view/splash/splash_view.dart' as _i1;
import '../../view/storageView/storage_view.dart' as _i6;

class NavigationRoute extends _i8.RootStackRouter {
  NavigationRoute([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    AuthView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthView());
    },
    HomeView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeView());
    },
    MapCityView.name: (routeData) {
      final args = routeData.argsAs<MapCityViewArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.MapCityView(
              key: args.key,
              lat: args.lat,
              long: args.long,
              cityName: args.cityName));
    },
    MapLocationView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MapLocationView());
    },
    StorageDetailView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.StorageDetailView());
    },
    BookSuccesView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BookSuccesView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashView.name, path: '/'),
        _i8.RouteConfig(AuthView.name, path: '/auth-view'),
        _i8.RouteConfig(HomeView.name, path: '/home-view'),
        _i8.RouteConfig(MapCityView.name, path: '/map-city-view'),
        _i8.RouteConfig(MapLocationView.name, path: '/map-location-view'),
        _i8.RouteConfig(StorageDetailView.name, path: '/storage-detail-view'),
        _i8.RouteConfig(BookSuccesView.name, path: '/book-succes-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashView extends _i8.PageRouteInfo<void> {
  const SplashView() : super(SplashView.name, path: '/');

  static const String name = 'SplashView';
}

/// generated route for
/// [_i2.AuthView]
class AuthView extends _i8.PageRouteInfo<void> {
  const AuthView() : super(AuthView.name, path: '/auth-view');

  static const String name = 'AuthView';
}

/// generated route for
/// [_i3.HomeView]
class HomeView extends _i8.PageRouteInfo<void> {
  const HomeView() : super(HomeView.name, path: '/home-view');

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.MapCityView]
class MapCityView extends _i8.PageRouteInfo<MapCityViewArgs> {
  MapCityView(
      {_i9.Key? key,
      required String lat,
      required String long,
      required String cityName})
      : super(MapCityView.name,
            path: '/map-city-view',
            args: MapCityViewArgs(
                key: key, lat: lat, long: long, cityName: cityName));

  static const String name = 'MapCityView';
}

class MapCityViewArgs {
  const MapCityViewArgs(
      {this.key,
      required this.lat,
      required this.long,
      required this.cityName});

  final _i9.Key? key;

  final String lat;

  final String long;

  final String cityName;

  @override
  String toString() {
    return 'MapCityViewArgs{key: $key, lat: $lat, long: $long, cityName: $cityName}';
  }
}

/// generated route for
/// [_i5.MapLocationView]
class MapLocationView extends _i8.PageRouteInfo<void> {
  const MapLocationView()
      : super(MapLocationView.name, path: '/map-location-view');

  static const String name = 'MapLocationView';
}

/// generated route for
/// [_i6.StorageDetailView]
class StorageDetailView extends _i8.PageRouteInfo<void> {
  const StorageDetailView()
      : super(StorageDetailView.name, path: '/storage-detail-view');

  static const String name = 'StorageDetailView';
}

/// generated route for
/// [_i7.BookSuccesView]
class BookSuccesView extends _i8.PageRouteInfo<void> {
  const BookSuccesView()
      : super(BookSuccesView.name, path: '/book-succes-view');

  static const String name = 'BookSuccesView';
}
