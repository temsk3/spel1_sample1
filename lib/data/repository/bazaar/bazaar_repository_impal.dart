import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/bazaar/bazaar_model.dart';
import '../../model/result/result.dart';
import 'bazaar_repository.dart';

final bazaarRepositoryProvider =
    Provider<BazaarRepository>((ref) => BazaarRepositoryImpl(ref.read));

class BazaarRepositoryImpl implements BazaarRepository {
  BazaarRepositoryImpl(this._reader);
  final Reader _reader;

  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'events';

  @override
  Future<Result<List<Bazaar>>> readBazaar() async {
    return Result.guardFuture(
      () async {
        // アイテムを取得
        // final CollectionReference collectionRef =
        //     _db.collection(_collectionPath);
        // final QuerySnapshot querySnapshot = await collectionRef.get();
        final QuerySnapshot querySnapshot =
            await _db.collection(_collectionPath).get();
        final List<QueryDocumentSnapshot> queryDocSnapshot = querySnapshot.docs;
        return queryDocSnapshot.map((doc) {
          final Map<String, dynamic> map = doc.data()! as Map<String, dynamic>;
          return Bazaar.fromJson(map).copyWith(id: doc.id);
        }).toList();

        // final CollectionReference bazaarRef = collectionRef.withConverter<Bazaar>(
        //       fromFirestore: (snap, _) => Bazaar.fromJson(snap.data()!),
        //       toFirestore: (bazaarbazaar, _) => bazaarbazaar.toJson(),
        //     );
        // final snap = await bazaarRef.get();
        // return snap.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  @override
  Future<Result<String>> createBazaar({required Bazaar bazaar}) async {
    return Result.guardFuture(
      () async {
        // アイテムを登録
        final docRef = await _db
            .collection(_collectionPath)
            .add(bazaar.toJson()..remove('id'));
        return docRef.id;
      },
    );
  }

  @override
  Future<Result<void>> updateBazaar({required Bazaar bazaar}) async {
    return Result.guardFuture(
      () async {
        // アイテムを更新
        await _db
            .collection(_collectionPath)
            .doc(bazaar.id)
            .update(bazaar.toJson());
      },
    );
  }

  @override
  Future<Result<void>> deleteBazaar({required bazaarId}) async {
    return Result.guardFuture(
      () async {
        // アイテムを削除
        await _db.collection(_collectionPath).doc(bazaarId).delete();
      },
    );
  }
}
