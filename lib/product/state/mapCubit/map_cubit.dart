import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/core/service/mapService/map_service.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  MapService mapService = MapService();

  Future<void> getMarkersFromCity({required String cityName}) async{
    emit(MapLoading());
   var markers =await mapService.fetchLuggageStoragesFromCity(cityName: cityName);
    emit(MapLoaded(markers: markers));
  }
}
