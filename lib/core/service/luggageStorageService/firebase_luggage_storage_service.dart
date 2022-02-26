import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseLuggageStorageService {
  Future<QuerySnapshot> fetchLuggageStorages({required String cityName}) async {
    try {
      final querySnaphot = await FirebaseFirestore.instance
          .collection('luggageStorages')
          .where('city', isEqualTo: cityName)
          .get();
      for (var doc in querySnaphot.docs) {
        doc['location'];
      }
      return querySnaphot;
    } catch (exception) {
      rethrow;
    }
  }

  Future<QuerySnapshot> fetchAvailabelCities() async {
    try {
      final collectionReference =
          await FirebaseFirestore.instance.collection('cities').get();
      return collectionReference;
    } catch (exception) {
      rethrow;
    }
  }

  // THIS FUNCTION ALLOWS USER TO RESERVE ANY STORAGE ON FIREBASES
  Future<void> reserveLuggageStorage({required String luggageId}) async {
    try {
      await FirebaseFirestore.instance.doc('/users/userId1').set({
        'rezervations': {luggageId}
      });
    } catch (exception) {
      rethrow;
    }
  }

  // List<Map<String, dynamic>> _convertToMap(QuerySnapshot collectionReference) {
  //   List<Map<String, dynamic>> luggageData = [{}];
  //   for (var doc in collectionReference.docs) {
  //     luggageData.add(
  //         {'id': doc['id'], 'city': doc['city'], 'location': doc['location']});
  //   }
  //   return luggageData;
  // }
}
