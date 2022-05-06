import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/result/result.dart';
import 'image_repository.dart';

final imageRepositoryProvider =
    Provider<ImageRepository>((ref) => ImageRepositoryImpl(ref.read));

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl(this._reader);
  final Reader _reader;

  final storage = FirebaseStorage.instance;
  final _path = 'events';

  @override
  Future<Result<void>> readImagePath() async {
    return Result.guardFuture(
      () async {
        return;
      },
    );
  }

  @override
  Future<Result<String>> uploadImage(
      {required Uint8List image, required String id}) async {
    return Result.guardFuture(
      () async {
        // 登録
        final storageRef = storage.ref();
        final mountainsRef = storageRef.child(_path).child('$id.jpg');
        try {
          await mountainsRef.putData(
            image,
            SettableMetadata(
              contentType: "image/jpeg",
            ),
          );
        } on FirebaseException catch (e) {
          e.toString();
        }
        return await mountainsRef.getDownloadURL();
      },
    );
  }

  // @override
  // Future<Result<String>> updateImage(
  //     {required Uint8List image, required String id}) async {
  //   return Result.guardFuture(
  //     () async {
  //       return;
  //     },
  //   );
  // }

  @override
  Future<Result<void>> deleteImage({required String id}) async {
    return Result.guardFuture(
      () async {
        String name = '$id.jpg';
        final storageRef = storage.ref();
        final mountainsRef = storageRef.child(_path);
        final listResult = await mountainsRef.listAll();
        for (var item in listResult.items) {
          if (item.name == name) {
            await mountainsRef.child(name).delete();
          }
        }
        // アイテムを削除
        // await storage.ref('$id.jpg').delete();
      },
    );
  }
}
