import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/product/state/mapCubit/map_cubit.dart';

class MapView extends StatefulWidget {
  final String lat;
  final String long;
  const MapView({Key? key, required this.lat, required this.long})
      : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..getMarkersFromLocation(),
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
                    myLocationEnabled: true,
                    markers: state.markers,
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        double.parse(widget.lat),
                        double.parse(widget.long),
                      ),
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
