import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<List<Map<String,String>>> getCities() async {
    var mapListData = <Map<String, String>>[];
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
      
      for (var doc in cities.docs) {
        for (var mapData in doc.get('cities')) {
          log(mapData);
          print('asfdas');
          Map<String, String> currentCity = {};
          currentCity.addEntries(mapData);
          mapListData.add(currentCity);
        }
      }
    } catch (e) {
      return <Map<String,String>>[];
    }
    return mapListData;
  }
}
