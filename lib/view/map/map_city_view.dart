import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/product/state/mapCubit/map_cubit.dart';

class MapCityView extends StatefulWidget {
  final String lat;
  final String long;
  const MapCityView({Key? key,required this.lat,required this.long}) : super(key: key);

  @override
  State<MapCityView> createState() => _MapViewState();
}

class _MapViewState extends State<MapCityView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..getMarkersFromCity(cityName: 'Istanbul'), //TODO MAKE DYNAMİC
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapLoading || state is MapInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            state as MapLoaded;
            return SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    markers: state.markers,
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _onMapCreated(controller);
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      setState(() {
        _controller.complete(controller);
      });
    }
  }
}
