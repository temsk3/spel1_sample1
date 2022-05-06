// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// @immutable
// class User {
//   final DocumentReference? ref;
//   final String name;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final DateTime? deletedAt;

//   const User({
//     this.ref,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//   });

//   //Firebaseからデータを取得する際の変換処理
//   factory User.fromJson(DocumentSnapshot data) {
//     final Map<String, dynamic> json = data.data()! as Map<String, dynamic>;
//     return User(
//       name: json['name']! as String,
//       createdAt: (json['createdAt']! as Timestamp).toDate(),
//       updatedAt: (json['updatedAt']! as Timestamp).toDate(),
//       deletedAt: (json['deletedAt'] as Timestamp?)?.toDate(),
//     );
//   }
//   // : this(
//   //     userId: json['userId']! as String,
//   //     name: json['name']! as String,
//   //     createdAt: (json['createdAt']! as Timestamp).toDate(),
//   //     updatedAt: (json['updatedAt']! as Timestamp).toDate(),
//   //     deletedAt: (json['deletedAt'] as Timestamp?)?.toDate(),
//   //   );

//   //DartのオブジェクトからFirebaseへ渡す際の変換処理
//   Map<String, Object?> toJson() {
//     Timestamp? deletedTimestamp;
//     if (deletedAt != null) {
//       deletedTimestamp = Timestamp.fromDate(deletedAt!);
//     }
//     return {
//       'name': name,
//       'createdAt':
//           Timestamp.fromDate(createdAt), //DartのDateTimeからFirebaseのTimestampへ変換
//       'updatedAt':
//           Timestamp.fromDate(updatedAt), //DartのDateTimeからFirebaseのTimestampへ変換
//       'deletedAt': deletedTimestamp
//     };
//   }
// }

// class UserDocument {
//   String documentId;
//   User user;

//   UserDocument(this.documentId, this.user);
// }
