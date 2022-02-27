import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<Map<String,String>> getCities() async {
    Map<String,String> fetchedCities=<String,String>{};
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
          for(var doc in cities.docs){
            
          }
    } catch (e) {

    }
    return <String,String>{};
  }
}
