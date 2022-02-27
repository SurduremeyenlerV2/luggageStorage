import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/product/state/mapCubit/map_cubit.dart';

class MapCityView extends StatefulWidget {
  final String lat;
  final String long;
  final String cityName;
  const MapCityView(
      {Key? key, required this.lat, required this.long, required this.cityName})
      : super(key: key);

  @override
  State<MapCityView> createState() => _MapViewState();
}

class _MapViewState extends State<MapCityView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MapCubit()..getMarkersFromCity(cityName: widget.cityName),
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapLoading || state is MapInitial) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            state as MapLoaded;
            return GoogleMapView(
              lat: double.parse(widget.lat),
              long: double.parse(widget.long),
              markers: state.markers,
            );
          }
        },
      ),
    );
  }
}

class GoogleMapView extends StatefulWidget {
  GoogleMapView({
    Key? key,
    required this.lat,
    required this.long,
    required this.markers,
  }) : super(key: key);

  final double lat;
  final double long;
  final Set<Marker> markers;

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            markers: widget.markers,
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.long),
              zoom: 8
            ),
            onMapCreated: (GoogleMapController controller) {
              _onMapCreated(controller);
            },
          ),
          // Positioned(
          //   width: MediaQuery.of(context).size.width,
          //   bottom: 20,
          //   child: Center(
          //     child: AnimatedOpacity(
          //       opacity: context.read<MapCubit>().changeInfoShow(),
          //       duration: Duration(milliseconds: 500),
          //       child: StorageInfo(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void addOnTapToMarkers() {
    Set<Marker> newMarkers = {};
    for (var marker in context.read<MapCubit>().markers) {
      var newMark = marker.copyWith(onTapParam: () {
        print('ASfsgdfhf');
        AutoRouter.of(context).replace(const StorageDetailView());
      });
      newMarkers.add(newMark);
    }
    context.read<MapCubit>().markers = newMarkers;
  }

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      setState(() {
        _controller.complete(controller);
      });
    }
  }
}
