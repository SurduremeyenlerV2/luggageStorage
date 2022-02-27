import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/product/state/mapCubit/map_cubit.dart';

class MapLocationView extends StatefulWidget {
  const MapLocationView({Key? key})
      : super(key: key);

  @override
  State<MapLocationView> createState() => _MapViewState();
}

class _MapViewState extends State<MapLocationView> {
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
                        state.cameraPosition!.latitude,
                        state.cameraPosition!.longitude,
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
