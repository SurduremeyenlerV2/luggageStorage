import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeService {
  Future<List<Map<String, dynamic>>> getCities() async {
    var mapListData = <Map<String, dynamic>>[];
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
      for (var doc in cities.docs) {
        for (var mapData in doc.get('cities')) {
          mapListData.add(mapData);
        }
      }
    } catch (e) {
      log('something happened');
    }
    return mapListData;
  }
}
