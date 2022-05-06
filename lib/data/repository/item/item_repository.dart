import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/item/item_model.dart';

class ItemRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'items';

  Future<List<Item>> itemList() async {
    try {
      final snapshot = await _db.collection(_collectionPath).get();
      return snapshot.docs.map((e) => Item.fromDocumentSnapshot(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
