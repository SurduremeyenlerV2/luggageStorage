import 'dart:typed_data';
import 'dart:ui';

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
      String markerUrl = 'https://w7.pngwing.com/pngs/896/6/png-transparent-macropodidae-computer-icons-kangaroo-koala-kangaroo-blue-animals-carnivoran.png';
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
}