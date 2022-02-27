import 'dart:typed_data';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper{
  
  Future<Set<Marker>> generateMarkers({required List<LatLng> markerPositions})async{
    var generatedMarkers = <Marker>[];

    for(var location in markerPositions){
      var marker = await createMarker(location.latitude.toString(), location.longitude.toString());
      generatedMarkers.add(marker!);
    }
    return generatedMarkers.toSet();
  }

    Future<Marker?> createMarker(String lat, String long) async{
      String markerUrl = 'https://img.icons8.com/external-icongeek26-outline-colour-icongeek26/344/external-kangaroo-origami-icongeek26-outline-colour-icongeek26.png';
      Marker _marker;
    var markerIcon = await getMarkerIcon(url: markerUrl);

    _marker = Marker(
      markerId: MarkerId(lat),
      position: LatLng(double.parse(lat),double.parse(long)),
      icon: BitmapDescriptor.fromBytes(markerIcon!)
    );
    return _marker;
    }
    
   Future<Uint8List?> getMarkerIcon(
      {required String url, int markerSize = 150}) async {
    try {
      var markerImageFile = await DefaultCacheManager().getSingleFile(url);
      var markerImageByte = await markerImageFile.readAsBytes();
      var markerImageCodec = await instantiateImageCodec(
        markerImageByte,
        targetWidth: markerSize,
        targetHeight: markerSize,
      );
      var frameInfo = await markerImageCodec.getNextFrame();
      var byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );
      var resizedMarkerImageBytes = byteData?.buffer.asUint8List();
      return resizedMarkerImageBytes;
    } catch (e) {
      return null;
    }
  }
  
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
}