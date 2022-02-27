import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/core/service/mapService/map_helper.dart';
import 'package:luggage_storage/core/service/mapService/map_service.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  MapService mapService = MapService();
  MapHelper mapHelper = MapHelper();

  Future<void> getMarkersFromCity({required String cityName}) async{
    emit(MapLoading());
   var markers =await mapService.fetchLuggageStoragesFromCity(cityName: cityName);
    emit(MapLoaded(markers: markers));
  }

  Future<void> getMarkersFromLocation() async{
    emit(MapLoading());
    Position currentLocation = await mapHelper.determinePosition();
   var markers =await mapService.fetchLuggageStoragesFromLocation(lat: currentLocation.latitude,long: currentLocation.longitude);
    emit(MapLoaded(markers: markers,cameraPosition: currentLocation));
  }
}
