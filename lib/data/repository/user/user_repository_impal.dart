// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../model/result/result.dart';
// import '../../model/user/user_model.dart';
// import 'user_repository.dart';

// final userRepositoryProvider =
//     Provider<UserRepository>((ref) => UserRepositoryImpl(ref.read));

// class UserRepositoryImpl implements UserRepository {
//   UserRepositoryImpl(this._reader);
//   final Reader _reader;

//   final _db = FirebaseFirestore.instance;
//   final _collectionPath = 'users';

//   @override
//   Future<Result<List<User>>> readUser() async {
//     // アイテムを取得
//     // final useraRef = _db.collection(_collectionPath).withConverter<User>(
//     //       fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
//     //       toFirestore: (user, _) => user.toJson(),
//     //     );
//     // final snap = await userRef.get();
//     // return snap.docs;
//     final userRef = await _db.collection(_collectionPath).get();
//     return Result.guardFuture(() async {
//       return userRef.docs.map((e) => User.fromJson(e)).toList();
//     });
//   }

//   @override
//   Future<String> createUser({required User user}) async {
//     // アイテムを登録
//     final userAdd = user;
//     final docRef = await _db.collection(_collectionPath).add(userAdd.toJson());
//     return docRef.id;
//   }

//   @override
//   Future<void> updateUser({required User user}) async {
//     // アイテムを更新
//     // await _db
//     //     .collection(_collectionPath)
//     //     .doc(user.ref)
//     //     .update(user.toJson());
//   }

//   @override
//   Future<void> deleteUser({required userId}) async {
//     // アイテムを削除
//     await _db.collection(_collectionPath).doc(userId).delete();
//   }
// }
