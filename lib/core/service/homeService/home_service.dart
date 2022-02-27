import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<Map<String, String>> getCities() async {
    List<Map<String, String>> fetchedCities = <Map<String, String>>[];
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
      for (var doc in cities.docs) {
        fetchedCities.add(doc.get('İstanbul'));
        log('${doc.get('İstanbul')}');
      }
    } catch (e) {}
    return <String, String>{};
  }
}
