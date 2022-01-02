import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return //[
        Firestore.instance
            .collection('Subtly_Meat')
            .where('searchKey',
                isEqualTo: searchField.substring(0, 1).toUpperCase())
            .where('status', isEqualTo: 'approved')
            .getDocuments();
  }
}
