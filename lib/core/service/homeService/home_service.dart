import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<Map<String, String>> getCities() async {
    try {
      final cities =
          await FirebaseFirestore.instance.collection('cities').get();
      for (var doc in cities.docs) {
        print(doc.get('cities'));
      }
    } catch (e) {}
    return <String, String>{};
  }
}
