import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luggage_storage/core/service/mapService/map_helper.dart';

class MapService {
  MapHelper mapHelper = MapHelper();

  Future<Set<Marker>> fetchLuggageStoragesFromCity(
      {required String cityName}) async {
    try {
      final collectionReference = await FirebaseFirestore.instance
          .collection('luggageStorages')
          .where('city', isEqualTo: cityName)
          .get();
      List<LatLng> positions = [];
      for (var pos in collectionReference.docs) {
        var lat = double.parse(pos['latitude']);
        var long = double.parse(pos['longitude']);
        var latLong = LatLng(lat, long);
        positions.add(latLong);
      }
      return await mapHelper.generateMarkers(markerPositions: positions);
    } catch (exception) {
      rethrow;
    }
  }

  Future<Set<Marker>> fetchLuggageStoragesFromLocation(
      {required double lat, required double long}) async {
    return <Marker>{};
  }
}
