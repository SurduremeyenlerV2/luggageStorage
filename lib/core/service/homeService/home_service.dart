import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<Map<String, String>> getCities() async {
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
      var mapListData = <List<Map<String, String>>>[];
      for (var doc in cities.docs) {
        for (var mapData in doc.get('cities')) {
          Map<String, String> mapX = {};
          mapX.addEntries(mapData);
        }
      }
    } catch (e) {}
    return <String, String>{};
  }
}
