import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseLuggageStorageService {
  Future<QuerySnapshot> fetchLuggageStorages() async {
    try {
      final collectionReference =
          await FirebaseFirestore.instance.collection('luggageStorages').get();
      return collectionReference;
    } catch (exception) {
      rethrow;
    }
  }

  Future<void> rezerveLuggageStorage({required String luggageId}) async {
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
